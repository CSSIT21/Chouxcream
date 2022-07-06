package payload

import (
	"time"

	"chouxcream-backend/types/enum"
)

type SignupInformation struct {
	Name     *string `json:"name" validate:"required,min=3,max=255"`
	Email    *string `json:"email" validate:"required,email"`
	Password *string `json:"password" validate:"omitempty,min=8,max=128"`
}

type LoginInformation struct {
	Email    *string `json:"email" validate:"required,email"`
	Password *string `json:"password" validate:"required,min=8,max=128"`
}

type Profile struct {
	Name         *string      `json:"name"`
	Email        *string      `json:"email"`
	AvatarUrl    *string      `json:"avatar_url"`
	Gender       *enum.Gender `json:"gender"`
	Birthdate    *time.Time   `json:"birthdate"`
	Height       *float64     `json:"height"`
	Weight       *float64     `json:"weight"`
	DesiredWight *float64     `json:"desired_wight"`
}
