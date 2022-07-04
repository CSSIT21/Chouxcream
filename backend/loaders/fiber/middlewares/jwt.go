package middlewares

import (
	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/jwt/v3"

	"chouxcream-backend/types/common"
	"chouxcream-backend/types/response"
	"chouxcream-backend/utils/config"
)

var Jwt = func() fiber.Handler {
	conf := jwtware.Config{
		SigningKey:  []byte(config.C.JwtSecret),
		TokenLookup: "header:Authorization",
		AuthScheme:  "Bearer",
		ContextKey:  "user",
		Claims:      &common.UserClaim{},
		ErrorHandler: func(c *fiber.Ctx, err error) error {
			return &response.GenericError{
				Message: "JWT validation failure",
				Err:     err,
			}
		},
	}

	return jwtware.New(conf)
}()
