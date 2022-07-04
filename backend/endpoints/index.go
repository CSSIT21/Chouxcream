package endpoints

import (
	"github.com/gofiber/fiber/v2"

	accountEndpoint "chouxcream-backend/endpoints/account"
)

func Init(router fiber.Router) {
	// * Account
	account := router.Group("account/")
	account.Post("login", accountEndpoint.LoginHandler)
	account.Post("register", accountEndpoint.SignupHandler)
}
