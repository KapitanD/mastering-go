package main

import (
	"fmt"
	"os"
	"strconv"
)

func main() {
	if len(os.Args) <= 1 {
		fmt.Fprintln(os.Stderr, "Please, give me more args")
		os.Exit(1)
	}

	var sum float64 = 0
	var count int = 0

	for _, arg := range os.Args {
		val, err := strconv.ParseFloat(arg, 64)
		if err != nil {
			continue
		}

		sum += val
		count += 1
	}

	fmt.Printf("%f\n", sum/float64(count))
}
