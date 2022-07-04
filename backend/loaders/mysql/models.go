package mysql

import (
	"gorm.io/gorm"

	"chouxcream-backend/loaders/mysql/models"
)

var UserModel *gorm.DB
var PreferenceModel *gorm.DB

func assignModel() {
	UserModel = Gorm.Model(new(models.User))
	PreferenceModel = Gorm.Model(new(models.Preference))
}
