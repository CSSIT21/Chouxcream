package models

import (
	"time"
)

type User struct {
	Id        *uint64    `gorm:"primaryKey"`
	Name      *string    `gorm:"type:VARCHAR(255); not null"`
	Email     *string    `gorm:"type:VARCHAR(255); index:email,unique; not null"`
	Password  *string    `gorm:"type:VARCHAR(255); not null"`
	AvatarUrl *string    `gorm:"type:VARCHAR(255); null"` // Null represents no avatar
	CreatedAt *time.Time `gorm:"not null"`                // Embedded field
	UpdatedAt *time.Time `gorm:"not null"`                // Embedded field
}
