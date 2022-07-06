package models

import "time"

type Menu struct {
	Id              *uint64    `json:"id" gorm:"primaryKey"`
	OwnerId         *uint64    `json:"owner_id" gorm:"null"` // Null represent that this menu is preset
	Owner           *User      `json:"owner" gorm:"foreignKey:OwnerId"`
	Name            *string    `json:"name" gorm:"not null"`
	ImageUrl        *string    `json:"image_url" gorm:"not null"`
	NumCalorie      *float64   `json:"num_calorie" gorm:"not null"`
	NumCarbohydrate *float64   `json:"num_carbohydrate" gorm:"not null"`
	NumProtein      *float64   `json:"num_protein" gorm:"not null"`
	NumFat          *float64   `json:"num_fat" gorm:"not null"`
	CreatedAt       *time.Time `gorm:"not null"` // Embedded field
	UpdatedAt       *time.Time `gorm:"not null"` // Embedded field
}
