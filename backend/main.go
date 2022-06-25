package main

import (
	"math/rand"
	"time"

	"chouxcream-backend/loaders/fiber"
	"chouxcream-backend/loaders/mysql"
)

func main() {
	rand.Seed(time.Now().UnixNano())

	mysql.Init()
	fiber.Init()
}
