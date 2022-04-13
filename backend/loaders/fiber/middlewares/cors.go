package middlewares

import (
	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/middleware/cors"

	"noty-backend/utils/config"
)

var Cors = func() fiber.Handler {
	// origins is the value of allowed CORS addresses, separated by comma (,).
	// Example: "https://www.google.com, https://www.bsthun.com, http://localhost:8080"
	origins := ""
	for i, s := range config.C.Cors {
		origins += s
		if i < len(config.C.Cors)-1 {
			origins += ", "
		}
	}

	config := cors.Config{
		AllowOrigins:     origins,
		AllowCredentials: true,
	}

	return cors.New(config)
}()
