package models

import (
	"time"

	"chouxcream-backend/types/enum"
)

type Preference struct {
	Id           *uint64      `gorm:"primaryKey"`
	User         *User        `gorm:"foreignKey:Id"`
	Gender       *enum.Gender `gorm:"type:ENUM('M', 'F', 'U'); not null"`
	Birthdate    *time.Time   `gorm:"not null"`
	Height       int          `gorm:"not null"`
	Weight       int          `gorm:"not null"`
	TargetWeight int          `gorm:"not null"`
}
