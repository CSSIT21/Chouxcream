package payload

type Progress struct {
	CaloriesGraph      *[7]float64 `json:"calories_graph"`
	IntakeCalorie      *float64    `json:"intake_calorie"`
	MaxCalorie         *float64    `json:"max_calorie"`
	IntakeProtein      *float64    `json:"intake_protein"`
	MaxProtein         *float64    `json:"max_protein"`
	IntakeCarbohydrate *float64    `json:"intake_carbohydrate"`
	MaxCarbohydrate    *float64    `json:"max_carbohydrate"`
	IntakeFat          *float64    `json:"intake_fat"`
	MaxFat             *float64    `json:"max_fat"`
}
