package account

import (
	"github.com/gofiber/fiber/v2"

	"chouxcream-backend/loaders/mysql"
	"chouxcream-backend/loaders/mysql/models"
	"chouxcream-backend/types/payload"
	"chouxcream-backend/types/response"
	"chouxcream-backend/utils/text"
)

// SignupHandler
// @ID account.signup.post
// @Summary Register
// @Description Register
// @Tags account
// @Accept json
// @Produce json
// @Param payload body payload.SignupInformation true "payload.SignupInformation"
// @Success 200 {object} response.InfoResponse
// @Failure 400 {object} response.ErrorResponse
// @Router /account/signup [post]
func SignupHandler(c *fiber.Ctx) error {
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

	hashedPassword, err := text.HashPassword(*body.Password)
	if err != nil {
		return err
	}

	// * Register user record
	user := &models.User{
		Name:     body.Name,
		Email:    body.Email,
		Password: &hashedPassword,
	}

	if result := mysql.Gorm.Create(user); result.Error != nil {
		return &response.GenericError{
			Message: "Unable to create user record",
			Err:     result.Error,
		}
	}

	return c.JSON(response.NewResponse("Successfully registered a user"))
}
