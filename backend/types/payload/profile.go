package payload

import (
	"time"

	"chouxcream-backend/types/enum"
)

type PreferenceInformation struct {
	Gender        *enum.Gender `json:"gender" validate:"required"`
	Birthdate     *time.Time   `json:"birth_date" validate:"required"`
	Height        *float64     `json:"height" validate:"required"`
	Weight        *float64     `json:"weight" validate:"required"`
	DesiredWeight *float64     `json:"desired_weight" validate:"required"`
}
