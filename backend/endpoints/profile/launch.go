package profile

import (
	"github.com/gofiber/fiber/v2"
	"github.com/golang-jwt/jwt/v4"

	"chouxcream-backend/procedures/account"
	"chouxcream-backend/types/common"
	"chouxcream-backend/types/response"
)

// LaunchHandler
// @ID profile.launch.get
// @Summary Launch information
// @Description Launch information
// @Tags profile
// @Accept json
// @Produce json
// @Success 200 {object} response.InfoResponse
// @Failure 400 {object} response.ErrorResponse
// @Router /profile/launch [get]
func LaunchHandler(c *fiber.Ctx) error {
	// * Parse user claims
	claims := c.Locals("user").(*jwt.Token).Claims.(*common.UserClaim)

	// * Get preference settled
	preferenceSettled, err := account.GetPreferenceSettled(*claims.UserId)
	if err != nil {
		return err
	}

	return c.JSON(response.NewResponse(map[string]any{
		"token":              "",
		"preference_settled": preferenceSettled,
	}))
}
