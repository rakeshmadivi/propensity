package main

import (
	"fmt"
)

// Structure to store elements and data
type Node struct{
	htag string
	text string
	children []*Node
}

func (n Node) NofChildren() int{
	return len(n.children)
}

func (n Node) GetContents(nchildren int) string{
	var elements string
	for i := 0;i < nchildren ;i++{
		elements += " " + n.children[i].text
	}

	return elements
}
func log(){
	fmt.Println("In main/htmlnodes.go")
}
