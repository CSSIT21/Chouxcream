package value

func Iterate[A any, B any](a []A, mapper func(a A) (B, error)) ([]B, error) {
	var result []B
	for _, el := range a {
		mapped, err := mapper(el)
		if err != nil {
			return nil, err
		}
		result = append(result, mapped)
	}
	return result, nil
}
