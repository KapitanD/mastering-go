GOOS?=darwin
GOARCH?=amd64

myCcode.o: callClib/*.c
	gcc -c callClib/*.c

callC.a: myCcode.o
	ar rs callC.a *.o

.PHONY: build
build: callC.a
	CGO_ENABLED=1 GOOS=${GOOS} GOARCH=${GOARCH} go build -o bin/main main.go
	$(MAKE) clean

.PHONY: run
run: build
	bin/main

.PHONY: clean
clean:
	rm -rf *.a *.o
