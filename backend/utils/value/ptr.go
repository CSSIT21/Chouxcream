package value

var TruePtr = Ptr(true)
var FalsePtr = Ptr(false)

func Ptr[T any](v T) *T {
	return &v
}
