package mysql

import "backend/loaders/mysql/models"

type Model struct {
	Name   string
	Struct any
}

var Models = []Model{
	{
		Name:   "games",
		Struct: new(models.Game),
	},
	{
		Name:   "packages",
		Struct: new(models.Package),
	},
	{
		Name:   "users",
		Struct: new(models.User),
	},
	{
		Name:   "user_faculties",
		Struct: new(models.UserFaculty),
	},
	{
		Name:   "organizations",
		Struct: new(models.Organization),
	},
	{
		Name:   "organization_games",
		Struct: new(models.OrganizationGame),
	},
	{
		Name:   "faculties",
		Struct: new(models.Faculty),
	},
	{
		Name:   "coupons",
		Struct: new(models.Coupon),
	},
	{
		Name:   "moderators",
		Struct: new(models.Moderator),
	},
	{
		Name:   "rebate_histories",
		Struct: new(models.RebateHistory),
	},
	{
		Name:   "payments",
		Struct: new(models.Payment),
	},
	{
		Name:   "orders",
		Struct: new(models.Order),
	},
}
