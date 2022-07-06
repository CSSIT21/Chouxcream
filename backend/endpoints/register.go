package endpoints

import (
	"github.com/gofiber/fiber/v2"

	accountEndpoint "chouxcream-backend/endpoints/account"
	profileEndpoint "chouxcream-backend/endpoints/profile"
	trackingEndpoint "chouxcream-backend/endpoints/tracking"
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
	profile.Get("info", profileEndpoint.GetProfileInfoHandler)
	profile.Patch("info", profileEndpoint.EditProfileInfoHandler)
	profile.Patch("preference", profileEndpoint.SetPreferenceHandler)

	// * Tracking
	tracking := router.Group("tracking/", middlewares.Jwt)
	tracking.Get("menus", trackingEndpoint.MenuListHandler)
	tracking.Post("record", trackingEndpoint.AddRecordHandler)
	tracking.Get("record/recent", trackingEndpoint.RecentRecordHandler)
	tracking.Get("progress", trackingEndpoint.ProgressGetHandler)

}
