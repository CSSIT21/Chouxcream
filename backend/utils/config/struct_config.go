package config

type config struct {
	Environment environment
	LogLevel    uint32

	Address      string
	ServerHeader string
	Cors         []string

	JwtSecret string

	MongoUri    string
	MongoDbName string
}
