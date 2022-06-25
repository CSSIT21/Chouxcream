package config

type environment uint8

const (
	dev environment = iota
	prod
)

func (v environment) String() string {
	return [...]string{"dev", "prod"}[v]
}

func (v *environment) Set(string string) {
	switch string {
	case "dev":
		*v = dev
	case "prod":
		*v = prod
	}
}
