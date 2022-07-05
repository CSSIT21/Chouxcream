package payload

type Menu struct {
	Id              *uint64  `json:"id"`
	Name            *string  `json:"name"`
	ImageUrl        *string  `json:"image_url"`
	NumCalorie      *float64 `json:"num_calorie"`
	NumCarbohydrate *float64 `json:"num_carbohydrate"`
	NumProtein      *float64 `json:"num_protein"`
	NumFat          *float64 `json:"num_fat"`
}
