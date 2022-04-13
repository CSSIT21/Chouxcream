package main

import (
	"math/rand"
	"time"

	"chouxcream-backend/loaders/fiber"
)

func main() {
	rand.Seed(time.Now().UnixNano())

	fiber.Init()
}
