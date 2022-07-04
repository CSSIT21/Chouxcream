package endpoints

import (
	"github.com/gofiber/fiber/v2"

	accountEndpoint "chouxcream-backend/endpoints/account"
	profileEndpoint "chouxcream-backend/endpoints/profile"
	"chouxcream-backend/loaders/fiber/middlewares"
)

func Register(router fiber.Router) {
	// * Account
	account := router.Group("account/")
	account.Post("login", accountEndpoint.LoginHandler)
	account.Post("signup", accountEndpoint.SignupHandler)

	// * Profile
	profile := router.Group("profile/", middlewares.Jwt)
	profile.Get("launch", profileEndpoint.LaunchHandler)
	profile.Patch("preference", profileEndpoint.SetPreferenceHandler)
}
