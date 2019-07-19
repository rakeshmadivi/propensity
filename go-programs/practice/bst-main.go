package main

import (
	"fmt"
	//"os"
	//"bufio"
	"time"
	"math/rand"
)

func randomInsert(){
	s1 := rand.NewSource(time.Now().UnixNano())
	r1 := rand.New(s1)
	var root *Node
	root=Insert(root,r1.Intn(100))
	fmt.Println("Root Node = ",root.value)
	for i:=1; i<10; i++{
		r2 := rand.New(s1)
		insval:=r2.Intn(100)
		fmt.Println("VALUE: ",insval)
		Insert(root,insval)
	}

	// Print all orders
	fmt.Println("InOrder:")
	InOrder(root)
	fmt.Println("\nPreOrder:")
	PreOrder(root)
	fmt.Println("\nPostOrder:")
	PostOrder(root)
	fmt.Println()
}

func arrayInsert(){
	a := []int{20,11,25,8,22,35,2,10,45,21}
	/* 
	Consider 20 as RootNode
			 20
	                 /\
		       11  25
		      /	   /\
		     8	  22 35
		    /\	 /    \
		   2 10 21     45
	IN-ORDER (LRr)  : 2 8 10 11 20 21 22 25 35 45
	PRE-ORDER (RLr) : 20 11 8 2 10 25 22 21 35 45
	POST-ORDER (LrR): 2 10 8 11 21 22 45 35 25 20
	*/

	var root *Node;
	root = Insert(root,a[0])

	for i:=1; i<len(a); i++{
		Insert(root,a[i])
	}

	// Print all orders
	fmt.Println("InOrder:")
	InOrder(root)
	fmt.Println("\nPreOrder:")
	PreOrder(root)
	fmt.Println("\nPostOrder:")
	PostOrder(root)
	fmt.Println()

	// Search Key
	Search(root,21)
	Search(root,55)
}

func main(){
	// Create Tree from Array Elements
	arrayInsert()

	// Use Random Numbers to Create Binary Tree
	//randomInsert()
}
