package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
)

func main() {
	in := os.Stdin
	defer in.Close()

	scanner := bufio.NewScanner(in)
	for scanner.Scan() {
		text := scanner.Text()
		if text == "END" {
			break
		}
		if _, err := strconv.Atoi(text); err != nil {
			fmt.Printf("Not integer error: %v\n", err)
			os.Exit(1)
		}
	}
}
