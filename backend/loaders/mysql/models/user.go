package models

import (
	"time"

	"backend/types/enum"
)

type User struct {
	Id               *uint64        `gorm:"primaryKey"`
	Firstname        *string        `gorm:"type:VARCHAR(255); not null"`
	Lastname         *string        `gorm:"type:VARCHAR(255); not null"`
	Email            *string        `gorm:"type:VARCHAR(255); index:email,unique; not null"`
	EmailVerified    *bool          `gorm:"default:false; not null"`
	AvatarUrl        *string        `gorm:"type:TEXT"` // Null represents no avatar picture
	Password         *string        `gorm:"type:VARCHAR(255); not null"`
	Type             *enum.UserType `gorm:"type:ENUM('student', 'normal_mod', 'org_mod', 'sale', 'admin'); not null"`
	SelfOrganization *string        `gorm:"type:VARCHAR(255); null"`
	SelfFaculty      *string        `gorm:"type:VARCHAR(255); null"`
	RefererId        *uint64        `gorm:"null"`
	Referer          *User          `gorm:"foreignKey:RefererId"`
	Suspension       *string        `gorm:"type:VARCHAR(255)"` // Null represents account still active
	CreatedAt        *time.Time     `gorm:"not null"`          // Embedded field
	UpdatedAt        *time.Time     `gorm:"not null"`          // Embedded field
}
