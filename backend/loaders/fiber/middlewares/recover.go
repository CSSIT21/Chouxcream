package middlewares

import (
	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/middleware/recover"

	"noty-backend/utils/config"
)

var Recover = func() fiber.Handler {
	if config.C.Environment.String() == "dev" {
		return func(ctx *fiber.Ctx) error {
			return ctx.Next()
		}
	}

	return recover.New()
}()
