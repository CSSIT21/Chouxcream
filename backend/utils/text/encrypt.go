package text

import (
	"github.com/golang-jwt/jwt/v4"
	"golang.org/x/crypto/bcrypt"

	"chouxcream-backend/types/response"
	"chouxcream-backend/utils/config"
)

func HashPassword(password string) (string, *response.GenericError) {
	bytes, err := bcrypt.GenerateFromPassword([]byte(password), bcrypt.DefaultCost)
	if err != nil {
		return "", &response.GenericError{
			Message: "Unable to hash password",
			Err:     err,
		}
	}
	return string(bytes), nil
}

func ComparePassword(hashedPassword string, password string) bool {
	if err := bcrypt.CompareHashAndPassword([]byte(hashedPassword), []byte(password)); err != nil {
		return false
	}
	return true
}

func SignJwt(claim jwt.Claims) (*string, *response.GenericError) {
	// * Generate signed token with HMAC
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claim)
	if signedToken, err := token.SignedString([]byte(config.C.JwtSecret)); err != nil {
		return nil, &response.GenericError{
			Message: "Unable to sign JWT token",
			Err:     err,
		}
	} else {
		return &signedToken, nil
	}

}
