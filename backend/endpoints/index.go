package endpoints

import (
	"github.com/gofiber/fiber/v2"
)

func Init(router fiber.Router) {
	// * Account
	_ = router.Group("account/")
}
