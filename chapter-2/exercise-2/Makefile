GOOS?=darwin
GOARCH?=amd64


usedByC.h usedByC.o: main.go 
	CGO_ENABLED=1 go build -o usedByC.o -buildmode=c-shared main.go

.PHONY: build
build: usedByC.h usedByC.o
	gcc -o bin/main callGo.c usedByC.o

.PHONY: run
run: build
	bin/main
	$(MAKE) clean

.PHONY: clean
clean:
	rm -rf *.h *.o
