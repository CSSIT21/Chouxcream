package payload

type SignupInformation struct {
	Firstname *string `json:"firstname" validate:"required,min=3,max=20"`
	Lastname  *string `json:"lastname" validate:"required,min=3,max=20"`
	Email     *string `json:"email" validate:"required,email"`
	Password  *string `json:"password" validate:"required,min=8,max=128"`
}

type LoginInformation struct {
	Email    *string `json:"email" validate:"required,email"`
	Password *string `json:"password" validate:"required,min=8,max=128"`
}
