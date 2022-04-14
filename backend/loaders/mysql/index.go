package mysql

import (
	"log"
	"os"
	"time"

	"github.com/sirupsen/logrus"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	"gorm.io/gorm/logger"

	"chouxcream-backend/utils/config"

	loggerUtils "chouxcream-backend/utils/logger"
)

var Gorm *gorm.DB

func Init() {
	// Initialize GORM instance using previously opened SQL connection
	gormLogLevel := []logger.LogLevel{
		logger.Silent,
		logger.Error,
		logger.Error,
		logger.Warn,
		logger.Info,
		logger.Info,
		logger.Info,
	}

	gormLogger := logger.New(
		log.New(os.Stdout, "\r\n", log.LstdFlags), // io writer
		logger.Config{
			SlowThreshold:             100 * time.Millisecond,
			LogLevel:                  gormLogLevel[config.C.LogLevel],
			IgnoreRecordNotFoundError: true,
			Colorful:                  true,
		},
	)

	// Open SQL connection
	dialector := mysql.New(
		mysql.Config{
			DSN:               config.C.MySqlDsn,
			DefaultStringSize: 255,
		},
	)

	if db, err := gorm.Open(dialector, &gorm.Config{
		Logger: gormLogger,
	}); err != nil {
		loggerUtils.Log(logrus.Fatal, "UNABLE TO LOAD GORM MYSQL DATABASE")
	} else {
		Gorm = db
	}

	// Initialize model migrations
	if config.C.MySqlMigrate {
		if err := migrate(); err != nil {
			loggerUtils.Log(logrus.Fatal, "UNABLE TO MIGRATE GORM MODEL")
		}
	}

	loggerUtils.Log(logrus.Debug, "INITIALIZED MYSQL CONNECTION")
}

func migrate() error {
	for _, model := range Models {
		if err := Gorm.AutoMigrate(model.Struct); err != nil {
			return err
		}
	}

	return nil
}
