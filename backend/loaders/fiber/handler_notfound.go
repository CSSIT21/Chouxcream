package fiber

import (
	"github.com/gofiber/fiber/v2"

	"chouxcream-backend/types/response"
)

func notfoundHandler(ctx *fiber.Ctx) error {
	return ctx.Status(fiber.StatusNotFound).JSON(response.ErrorResponse{
		Success: false,
		Message: "Not found",
		Error:   "404_NOT_FOUND",
	})
}
