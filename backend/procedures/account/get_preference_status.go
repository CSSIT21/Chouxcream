package account

import (
	"database/sql"

	"chouxcream-backend/loaders/mysql"
	"chouxcream-backend/types/response"
	"chouxcream-backend/utils/value"
)

func GetPreferenceSettled(userId uint64) (*bool, *response.GenericError) { // * Fetch preference settings
	var preferenceCount int
	if result := mysql.PreferenceModel.Select("COUNT(user_id)").Where("user_id = ?", userId).First(&preferenceCount); result.Error != nil && result.Error != sql.ErrNoRows {
		return nil, &response.GenericError{
			Message: "Get preference settled: unable to query user record",
			Err:     result.Error,
		}
	}

	return value.Ptr(preferenceCount > 0), nil
}
