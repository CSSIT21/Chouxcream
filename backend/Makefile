all: run

run:
	go run ./main.go

dev:
	air run

swag:
	swag init -g ./swagger/index.go -o ./swagger

tidy:
	go mod tidy
	go fmt backend/...

build:
	go build -o ./local/backend .

build-linux:
	env GOOS=linux GOARCH=amd64 go build -o ./local/backend_linux .

build-prod:
	env CGO_ENABLED=0 go build -o ./local/backend_prod .