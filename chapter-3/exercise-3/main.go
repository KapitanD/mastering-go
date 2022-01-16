package main

import "fmt"

const (
	p4_0 int = 1 << (2 * iota)
	p4_1
	p4_2
)

func main() {
	fmt.Printf("4^0: %v\n4^1: %v\n4^2: %v\n", p4_0, p4_1, p4_2)
	return
}
