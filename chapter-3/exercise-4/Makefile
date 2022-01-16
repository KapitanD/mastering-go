GOOS?=darwin
GOARCH?=amd64

.PHONY: build
build: 
	CGO_ENABLED=0 GOOS=${GOOS} GOARCH=${GOARCH} go build -o bin/main main.go

.PHONY: run
run: build
	bin/main

