package tracking

import (
	"fmt"

	"github.com/gofiber/fiber/v2"
	"github.com/golang-jwt/jwt/v4"

	"chouxcream-backend/loaders/mysql"
	"chouxcream-backend/loaders/mysql/models"
	"chouxcream-backend/types/common"
	"chouxcream-backend/types/payload"
	"chouxcream-backend/types/response"
	"chouxcream-backend/utils/value"
)

// MenuListHandler
// @ID tracking.menu.get
// @Summary Menu list
// @Description Menu list
// @Tags tracking
// @Accept json
// @Produce json
// @Success 200 {object} response.InfoResponse
// @Failure 400 {object} response.ErrorResponse
// @Router /tracking/menus [get]
func MenuListHandler(c *fiber.Ctx) error {
	// * Parse user claims
	claims := c.Locals("user").(*jwt.Token).Claims.(*common.UserClaim)

	// * Parse query params
	query := c.Query("query")

	var menus []*models.Menu
	if result := mysql.Gorm.Where("(owner_id IS null OR owner_id = ?) AND name LIKE ?", claims.UserId, fmt.Sprintf("%%%s%%", query)).Limit(20).Find(&menus); result.Error != nil {
		return &response.GenericError{
			Message: "Unable to get menu list",
			Err:     result.Error,
		}
	}

	mappedMenu, _ := value.Iterate(menus, func(menu *models.Menu) (*payload.Menu, error) {
		return &payload.Menu{
			Id:              menu.Id,
			Name:            menu.Name,
			ImageUrl:        menu.ImageUrl,
			NumCalorie:      menu.NumCalorie,
			NumCarbohydrate: menu.NumCarbohydrate,
			NumProtein:      menu.NumProtein,
			NumFat:          menu.NumFat,
		}, nil
	})

	return c.JSON(response.NewResponse(mappedMenu))
}
