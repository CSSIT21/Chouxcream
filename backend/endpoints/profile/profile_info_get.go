package profile

import (
	"github.com/gofiber/fiber/v2"
	"github.com/golang-jwt/jwt/v4"

	"chouxcream-backend/loaders/mysql"
	"chouxcream-backend/loaders/mysql/models"
	"chouxcream-backend/types/common"
	"chouxcream-backend/types/payload"
	"chouxcream-backend/types/response"
	"chouxcream-backend/utils/value"
)

// GetProfileInfoHandler
// @ID profile.info.get
// @Summary Get user profile
// @Description Get user profile
// @Tags profile
// @Accept json
// @Produce json
// @Param payload body payload.PreferenceInformation true "payload.PreferenceInformation"
// @Success 200 {object} response.InfoResponse
// @Failure 400 {object} response.ErrorResponse
// @Router /profile/info [get]
func GetProfileInfoHandler(c *fiber.Ctx) error {
	// * Parse user claims
	claims := c.Locals("user").(*jwt.Token).Claims.(*common.UserClaim)

	// * Get user profile
	record := new(models.User)
	if result := mysql.Gorm.Where("id = ?", claims.UserId).First(record); result.Error != nil {
		return &response.GenericError{
			Message: "Unable to get user profile",
			Err:     result.Error,
		}
	}

	// * Apply default avatar
	if record.AvatarUrl == nil {
		record.AvatarUrl = value.Ptr("https://lh3.googleusercontent.com/a-/AOh14GjERdoLShTAHLVlrjX87lm3q1bJZC6luPiIide3Zg")
	}

	return c.JSON(response.NewResponse(&payload.Profile{
		Name:      record.Name,
		Email:     record.Email,
		AvatarUrl: record.AvatarUrl,
	}))
}
