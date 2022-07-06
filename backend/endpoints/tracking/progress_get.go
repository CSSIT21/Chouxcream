package tracking

import (
	"time"

	"github.com/gofiber/fiber/v2"
	"github.com/golang-jwt/jwt/v4"

	"chouxcream-backend/loaders/mysql"
	"chouxcream-backend/loaders/mysql/models"
	"chouxcream-backend/types/common"
	"chouxcream-backend/types/enum"
	"chouxcream-backend/types/payload"
	"chouxcream-backend/types/response"
	"chouxcream-backend/utils/value"
)

// ProgressGetHandler
// @ID tracking.progress.get
// @Summary Get Progress
// @Description Get Progress
// @Tags tracking
// @Accept json
// @Produce json
// @Success 200 {object} response.InfoResponse
// @Failure 400 {object} response.ErrorResponse
// @Router /tracking/progress [get]
func ProgressGetHandler(c *fiber.Ctx) error {
	// * Parse user claims
	claims := c.Locals("user").(*jwt.Token).Claims.(*common.UserClaim)

	// * Get user preference
	preference := new(models.Preference)
	if result := mysql.Gorm.Where("user_id = ?", claims.UserId).First(preference); result.Error != nil {
		return &response.GenericError{
			Message: "Unable to get user preference",
			Err:     result.Error,
		}
	}

	// * Get user records
	var records []*models.Record
	if result := mysql.Gorm.Preload("Menu").Where("DATE(records.created_at) >= DATE(NOW() - INTERVAL 7 DAY) AND user_id = ?", claims.UserId).Find(&records); result.Error != nil {
		return &response.GenericError{
			Message: "Unable to get record list",
			Err:     result.Error,
		}
	}

	var calories [7]float64
	var calorie float64
	var protein float64
	var carbohydrate float64
	var fat float64
	for _, record := range records {
		if time.Now().Sub(*record.CreatedAt).Hours() < 24 {
			calorie += *record.CustomCalorie
			protein += *record.CustomProtein
			carbohydrate += *record.CustomCarbohydrate
			fat += *record.CustomFat
		} else {
			calories[int(8-time.Now().Sub(*record.CreatedAt).Hours()/24)] += *record.CustomCalorie
		}
	}

	var bmr float64
	if *preference.Gender == enum.GenderMale {
		bmr = 66 + (13.7 * *preference.Weight) + (5 * *preference.Height) - (6.8 * time.Now().Sub(*preference.Birthdate).Hours() / 24 / 365)
	} else {
		bmr = 665 + (9.6 * *preference.Weight) + (1.8 * *preference.Height) - (4.7 * time.Now().Sub(*preference.Birthdate).Hours() / 24 / 365)
	}

	return c.JSON(response.NewResponse(&payload.Progress{
		CaloriesGraph:      &calories,
		IntakeCalorie:      &calorie,
		MaxCalorie:         &bmr,
		IntakeProtein:      &protein,
		MaxProtein:         preference.Weight,
		IntakeCarbohydrate: &carbohydrate,
		MaxCarbohydrate:    value.Ptr(*preference.Weight * 4),
		IntakeFat:          &fat,
		MaxFat:             value.Ptr(bmr * 30 / 100),
	}))

}
