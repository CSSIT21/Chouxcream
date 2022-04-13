package fiber

import (
	"github.com/gofiber/fiber/v2"

	"noty-backend/types/responder"
)

func notfoundHandler(ctx *fiber.Ctx) error {
	return ctx.Status(fiber.StatusNotFound).JSON(responder.ErrorResponse{
		Success: false,
		Error:   "404_NOT_FOUND",
	})
}
