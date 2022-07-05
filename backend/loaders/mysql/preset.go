package mysql

import (
	"encoding/json"
	"io/ioutil"

	"github.com/sirupsen/logrus"

	"chouxcream-backend/loaders/mysql/models"
	"chouxcream-backend/utils/logger"
)

func preset() {
	var menuCount int
	if result := MenuModel.Select("COUNT(id)").First(&menuCount); result.Error != nil {
		logger.Log(logrus.Fatal, "UNABLE TO CHECK FOR PRESET INSERTION")
	}

	if menuCount == 0 {
		var menus []*models.Menu
		if bytes, err := ioutil.ReadFile("./resources/menus.json"); err != nil {
			logger.Log(logrus.Fatal, "UNABLE TO READ MENUS FILE")
		} else {
			if err := json.Unmarshal(bytes, &menus); err != nil {
				logger.Log(logrus.Fatal, "UNABLE TO PARSE TIMEZONE FILE")
			}
		}

		for _, menu := range menus {
			if result := Gorm.Create(menu); result.Error != nil {
				logger.Log(logrus.Fatal, "UNABLE TO INSERT MENU")
			}
		}
	}
}
