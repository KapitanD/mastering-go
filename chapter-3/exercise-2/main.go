package main

import "fmt"

func main() {
	arr := [10]int{1, 2, 3, 4, 5, 6, 7, 8, 9, 10}

	myMap := make(map[int]int)
	for idx, val := range arr {
		myMap[idx] = val
	}

	fmt.Println(myMap)
	return
}
