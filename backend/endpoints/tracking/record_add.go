package tracking

import (
	"time"

	"github.com/gofiber/fiber/v2"
	"github.com/golang-jwt/jwt/v4"

	"chouxcream-backend/loaders/mysql"
	"chouxcream-backend/loaders/mysql/models"
	"chouxcream-backend/types/common"
	"chouxcream-backend/types/payload"
	"chouxcream-backend/types/response"
)

// AddRecordHandler
// @ID tracking.record.add.post
// @Summary Add new record
// @Description Add new record
// @Tags tracking
// @Accept json
// @Produce json
// @Param payload body payload.Record true "payload.Record"
// @Success 200 {object} response.InfoResponse
// @Failure 400 {object} response.ErrorResponse
// @Router /tracking/record [post]
func AddRecordHandler(c *fiber.Ctx) error {
	// * Parse user claims
	claims := c.Locals("user").(*jwt.Token).Claims.(*common.UserClaim)

	// * Parse body
	body := new(payload.Record)
	if err := c.BodyParser(&body); err != nil {
		return &response.GenericError{
			Message: "Unable to parse body",
			Err:     err,
		}
	}

	// Convery payload to model
	record := &models.Record{
		UserId:             claims.UserId,
		MenuId:             body.MenuId,
		Meal:               body.Meal,
		CustomCalorie:      body.Calorie,
		CustomProtein:      body.Protein,
		CustomCarbohydrate: body.Carbohydrate,
		CustomFat:          body.Fat,
	}

	if err := mysql.Gorm.Create(&record).Error; err != nil {
		return &response.GenericError{
			Message: "Unable to create record",
			Err:     err,
		}
	}

	time.Sleep(2 * time.Second)

	return c.JSON(response.NewResponse("Successfully added new record"))
}
