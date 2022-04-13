package models

import "time"

type UserFaculty struct {
	UserId    *uint64    `gorm:"primaryKey"`
	User      *User      `gorm:"foreignKey:UserId"`
	FacultyId *uint64    `gorm:"primaryKey"`
	Faculty   *Faculty   `gorm:"foreignKey:FacultyId"`
	MemberNo  *string    `gorm:"type:VARCHAR(255); not null"`
	Email     *string    `gorm:"type:VARCHAR(255); <-:create"`
	CreatedAt *time.Time `gorm:"not null"` // Embedded field
	UpdatedAt *time.Time `gorm:"not null"` // Embedded field
}
