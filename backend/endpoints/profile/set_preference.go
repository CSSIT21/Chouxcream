package profile

import (
	"github.com/gofiber/fiber/v2"
	"github.com/golang-jwt/jwt/v4"

	"chouxcream-backend/loaders/mysql"
	"chouxcream-backend/loaders/mysql/models"
	"chouxcream-backend/types/common"
	"chouxcream-backend/types/payload"
	"chouxcream-backend/types/response"
	"chouxcream-backend/utils/text"
)

// SetPreferenceHandler
// @ID profile.preference.patch
// @Summary Update user preference
// @Description Update user preference
// @Tags profile
// @Accept json
// @Produce json
// @Param payload body payload.PreferenceInformation true "payload.PreferenceInformation"
// @Success 200 {object} response.InfoResponse
// @Failure 400 {object} response.ErrorResponse
// @Router /profile/preference [patch]
func SetPreferenceHandler(c *fiber.Ctx) error {
	// * Parse user claims
	claims := c.Locals("user").(*jwt.Token).Claims.(*common.UserClaim)

	// * Parse body
	body := new(payload.PreferenceInformation)
	if err := c.BodyParser(&body); err != nil {
		return &response.GenericError{
			Message: "Unable to parse body",
			Err:     err,
		}
	}

	// * Validate body
	if err := text.Validator.Struct(body); err != nil {
		return err
	}

	record := &models.Preference{
		UserId:       claims.UserId,
		Gender:       body.Gender,
		Birthdate:    body.Birthdate,
		Height:       body.Height,
		Weight:       body.Weight,
		TargetWeight: body.DesiredWeight,
	}

	if result := mysql.Gorm.Save(record); result.Error != nil {
		return &response.GenericError{
			Message: "Unable to update user preference",
			Err:     result.Error,
		}
	}

	return c.JSON(response.NewResponse("Successfully updated user preference"))
}
