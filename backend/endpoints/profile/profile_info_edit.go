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

// EditProfileInfoHandler
// @ID profile.info.patch
// @Summary Edit user profile
// @Description Edit user profile
// @Tags profile
// @Accept json
// @Produce json
// @Param payload body payload.SignupInformation true "payload.SignupInformation"
// @Success 200 {object} response.InfoResponse
// @Failure 400 {object} response.ErrorResponse
// @Router /profile/info [patch]
func EditProfileInfoHandler(c *fiber.Ctx) error {
	// * Parse user claims
	claims := c.Locals("user").(*jwt.Token).Claims.(*common.UserClaim)

	// * Parse body
	body := new(payload.SignupInformation)
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

	record := &models.User{
		Name:  body.Name,
		Email: body.Email,
	}

	if result := mysql.Gorm.Where("id = ?", claims.UserId).Updates(record); result.Error != nil {
		return &response.GenericError{
			Message: "Unable to update user profile",
			Err:     result.Error,
		}
	}

	return c.JSON(response.NewResponse("Successfully updated user profile"))
}
