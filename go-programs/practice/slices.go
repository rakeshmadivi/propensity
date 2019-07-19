package main

import (
	"fmt"
)

func main() {
elements := []int{3, 5, 2, 6, 2}
arrays := make([ ]int, 0, 3) //Creating slice with make( )
for n := range elements {
	fmt.Println("Elements", n)
}
for i := 0; i < 80; i++ {
	arrays = append(arrays, i) // to append i elements to slice
	fmt.Println("Len:", len(arrays), "Capacity:", cap(arrays),"Value: ", arrays[i])
}
}
