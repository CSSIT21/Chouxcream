package models

import (
	"time"

	"chouxcream-backend/types/enum"
)

type Preference struct {
	UserId       *uint64      `gorm:"primaryKey"`
	User         *User        `gorm:"foreignKey:UserId"`
	Gender       *enum.Gender `gorm:"type:ENUM('M', 'F', 'U'); not null"`
	Birthdate    *time.Time   `gorm:"not null"`
	Height       *float64     `gorm:"not null"`
	Weight       *float64     `gorm:"not null"`
	TargetWeight *float64     `gorm:"not null"`
	CreatedAt    *time.Time   `gorm:"not null"` // Embedded field
	UpdatedAt    *time.Time   `gorm:"not null"` // Embedded field
}
