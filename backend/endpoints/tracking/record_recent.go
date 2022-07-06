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

// RecentRecordHandler
// @ID tracking.record.recent.get
// @Summary Recent record list
// @Description Recent record list
// @Tags tracking
// @Accept json
// @Produce json
// @Success 200 {object} response.InfoResponse
// @Failure 400 {object} response.ErrorResponse
// @Router /tracking/record/recent [get]
func RecentRecordHandler(c *fiber.Ctx) error {
	// * Parse user claims
	claims := c.Locals("user").(*jwt.Token).Claims.(*common.UserClaim)

	var records []*models.Record
	if result := mysql.Gorm.Preload("Menu").Where("DATE(records.created_at)=CURDATE() AND user_id = ?", claims.UserId).Find(&records); result.Error != nil {
		return &response.GenericError{
			Message: "Unable to get record list",
			Err:     result.Error,
		}
	}

	var calorie float64
	mappedRecord, _ := value.Iterate(records, func(record *models.Record) (*payload.Record, error) {
		calorie += *record.CustomCalorie

		return &payload.Record{
			Id:           record.Id,
			MenuName:     record.Menu.Name,
			MenuImageUrl: record.Menu.ImageUrl,
			Meal:         record.Meal,
			Calorie:      record.CustomCalorie,
			Protein:      record.CustomProtein,
			Carbohydrate: record.CustomCarbohydrate,
			Fat:          record.CustomFat,
		}, nil
	})

	var preference *models.Preference
	if result := mysql.Gorm.Where("user_id = ?", claims.UserId).First(&preference); result.Error != nil {
		return &response.GenericError{
			Message: "Unable to get preference",
			Err:     result.Error,
		}
	}

	var bmr float64
	if *preference.Gender == enum.GenderMale {
		bmr = 66 + (13.7 * *preference.Weight) + (5 * *preference.Height) - (6.8 * time.Now().Sub(*preference.Birthdate).Hours() / 24 / 365)
	} else {
		bmr = 665 + (9.6 * *preference.Weight) + (1.8 * *preference.Height) - (4.7 * time.Now().Sub(*preference.Birthdate).Hours() / 24 / 365)
	}

	return c.JSON(response.NewResponse(map[string]any{
		"calorie": calorie,
		"bmr":     bmr,
		"records": mappedRecord,
	}))
}
