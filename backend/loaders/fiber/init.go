package fiber

import (
	"time"

	"github.com/sirupsen/logrus"

	"github.com/gofiber/fiber/v2"

	"noty-backend/endpoints"
	"noty-backend/loaders/fiber/middlewares"
	"noty-backend/swagger"
	"noty-backend/types/responder"
	"noty-backend/utils/config"
	"noty-backend/utils/logger"
)

var app *fiber.App

func Init() {
	// Initialize fiber instance
	app = fiber.New(fiber.Config{
		ErrorHandler:  errorHandler,
		Prefork:       false,
		StrictRouting: true,
		ServerHeader:  config.C.ServerHeader,
		ReadTimeout:   5 * time.Second,
		WriteTimeout:  5 * time.Second,
	})

	// Register root endpoint
	app.All("/", func(c *fiber.Ctx) error {
		return c.JSON(responder.InfoResponse{
			Success: true,
			Info:    "KONLAYUTH_HOMEPAGE_API_ROOT",
		})
	})

	// Register swagger endpoint
	swaggerGroup := app.Group("swagger/")

	if config.C.Environment.String() == "dev" {
		swagger.Init(swaggerGroup)
	}

	// Register API endpoints
	apiGroup := app.Group("api/")

	apiGroup.Use(middlewares.Limiter)
	apiGroup.Use(middlewares.Cors)
	apiGroup.Use(middlewares.Recover)

	endpoints.Init(apiGroup)

	// Register not found handler
	app.Use(notfoundHandler)

	// Startup
	err := app.Listen(config.C.Address)
	if err != nil {
		logger.Log(logrus.Fatal, err.Error())
	}
}
