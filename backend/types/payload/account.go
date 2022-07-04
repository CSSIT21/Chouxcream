package payload

type SignupInformation struct {
	Name     *string `json:"name" validate:"required,min=3,max=255"`
	Email    *string `json:"email" validate:"required,email"`
	Password *string `json:"password" validate:"required,min=8,max=128"`
}

type LoginInformation struct {
	Email    *string `json:"email" validate:"required,email"`
	Password *string `json:"password" validate:"required,min=8,max=128"`
}
