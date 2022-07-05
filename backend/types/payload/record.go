package payload

import "chouxcream-backend/types/enum"

type Record struct {
	Id           *uint64    `json:"id"`
	MenuId       *uint64    `json:"menu_id" validate:"omitempty,gt=0"`
	MenuName     *string    `json:"menu_name"`
	MenuImageUrl *string    `json:"menu_image_url"`
	Meal         *enum.Meal `json:"meal"`
	Calorie      *float64   `json:"calorie" validate:"gte=0"`
	Protein      *float64   `json:"protein" validate:"gte=0"`
	Carbohydrate *float64   `json:"carbohydrate" validate:"gte=0"`
	Fat          *float64   `json:"fat" validate:"gte=0"`
}
