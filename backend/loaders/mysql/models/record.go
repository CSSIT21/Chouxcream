package models

import (
	"chouxcream-backend/types/enum"
)

type Record struct {
	Id                 *uint64    `gorm:"primaryKey"`
	UserId             *uint64    `gorm:"not null"`
	User               *User      `gorm:"foreignKey:UserId"`
	MenuId             *uint64    `gorm:"not null"`
	Menu               *Menu      `gorm:"foreignKey:MenuId"`
	Meal               *enum.Meal `gorm:"type:ENUM('breakfast', 'launch', 'dinner', 'snack'); not null"`
	CustomCalorie      *float64   `gorm:"not null"`
	CustomProtein      *float64   `gorm:"not null"`
	CustomCarbohydrate *float64   `gorm:"not null"`
	CustomFat          *float64   `gorm:"not null"`
}
