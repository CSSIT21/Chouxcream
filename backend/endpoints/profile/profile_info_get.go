package profile

import (
	"fmt"

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
	user := new(models.User)
	if result := mysql.Gorm.Where("id = ?", claims.UserId).First(user); result.Error != nil {
		return &response.GenericError{
			Message: "Unable to get user profile",
			Err:     result.Error,
		}
	}

	// * Apply default avatar
	if user.AvatarUrl == nil {
		user.AvatarUrl = value.Ptr(fmt.Sprintf("https://avatars.dicebear.com/api/adventurer/%s_%s_%d.png", *user.Name, *user.Email, *user.Id))
	}

	// * Get user preference
	preference := new(models.Preference)
	if result := mysql.Gorm.Where("user_id = ?", claims.UserId).First(preference); result.Error != nil {
		return &response.GenericError{
			Message: "Unable to get user preference",
			Err:     result.Error,
		}
	}

	return c.JSON(response.NewResponse(&payload.Profile{
		Name:         user.Name,
		Email:        user.Email,
		AvatarUrl:    user.AvatarUrl,
		Gender:       preference.Gender,
		Birthdate:    preference.Birthdate,
		Height:       preference.Height,
		Weight:       preference.Weight,
		DesiredWight: preference.TargetWeight,
	}))
}
