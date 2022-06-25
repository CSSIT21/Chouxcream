package account

import (
	"database/sql"

	"github.com/gofiber/fiber/v2"

	"chouxcream-backend/loaders/mysql"
	"chouxcream-backend/loaders/mysql/models"
	"chouxcream-backend/types/common"
	"chouxcream-backend/types/payload"
	"chouxcream-backend/types/response"
	"chouxcream-backend/utils/text"
)

// LoginHandler
// @ID account.login.post
// @Summary Login
// @Description Login
// @Tags account
// @Accept json
// @Produce json
// @Param payload body payload.LoginInformation true "payload.LoginInformation"
// @Success 200 {object} responder.InfoResponse
// @Failure 400 {object} responder.ErrorResponse
// @Router /account/login [post]
func LoginHandler(c *fiber.Ctx) error {
	// * Parse body
	body := new(payload.LoginInformation)
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

	// * Query user record
	user := new(models.User)
	if result := mysql.Gorm.Where("email = ?", body.Email).First(user); result.Error == sql.ErrNoRows {
		return &response.GenericError{
			Message: "User was not found",
		}
	} else if result.Error != nil {
		return &response.GenericError{
			Message: "Unable to query user record",
			Err:     result.Error,
		}
	}

	// * Validate password
	if !text.ComparePassword(*body.Password, *user.Password) {
		return &response.GenericError{
			Message: "Incorrect password",
		}
	}

	// * Generate claims
	claims := &common.UserClaim{
		UserId: user.Id,
	}

	// * Generate token
	token, err := text.SignJwt(claims)
	if err != nil {
		return &response.GenericError{
			Message: "Unable to generate token",
			Err:     err,
		}
	}

	// * Fetch preference settings
	preferenceCount := new(int)
	if result := mysql.Gorm.Select("COUNT(id)").Where("id = ?", user.Id).First(preferenceCount); result.Error != nil && result.Error != sql.ErrNoRows {
		return &response.GenericError{
			Message: "Unable to query user record",
			Err:     result.Error,
		}
	}

	return c.JSON(response.NewResponse("Successfully logged in", map[string]any{"token": token, "setup": preferenceCount == nil}))
}
