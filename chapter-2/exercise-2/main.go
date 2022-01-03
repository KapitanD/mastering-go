package main

import "C"
import "fmt"

//export Square
func Square(a int) int {
	return a * a
}

//export PrintMessage
func PrintMessage() {
	fmt.Printf("Msg from Go!\n")
}

func main() {
}
