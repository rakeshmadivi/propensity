package main

import(
	"fmt"
	"os"
	/*
	"bufio"
	"log"
	"time"
	"strconv"
	*/
)

func exit(ec int){
	os.Exit(ec)
}

// Node Structure
type Node struct{
	//parent *Node
	value int
	left *Node
	right *Node
}

func NewNode(val int) *Node{
	n := new(Node)
	n.value = val
	//n.left = n.right = nil
	return n
}

func bst(n *Node){
	fmt.Println("Todo")
}

// Insert a Node
func Insert(node *Node,val int) *Node{
	//fmt.Println("Insert() - Node-",id)
	if node == nil {
		fmt.Println("Root is not available. Creating one.")
		node := new(Node)
		node.value = val
		node.left = nil
		node.right =nil
		fmt.Println("Created with:",node)
		return node
	}else{
		if node.value > val{
			fmt.Println(val,"to-LEFT-of",node.value)
			if node.left == nil{
				node.left = &Node{value:val}
			}else{
				node.left = Insert(node.left,val)
			}
		}else if node.value < val{
			fmt.Println(val,"to-RIGHT-of",node.value)
			if node.right == nil{
				node.right = &Node{value:val}
			}else{
				node.right = Insert(node.right,val)
			}
		}else{
			fmt.Println("Value already exists.")
		}
		return node
	}
}

// Search a key/value in tree
func Search(root *Node,key int){
	if key == root.value{fmt.Println("Found Key Here.")}
	if key < root.value {
		if root.left != nil {
			fmt.Println("Move <=LEFT from: ",root.value)
			Search(root.left,key)
		}else{fmt.Println("No Matched Key Found.");exit(0)}
	}
	if key > root.value {
		if root.right != nil {
			fmt.Println("Move RIGHT=> from: ",root.value)
			Search(root.right,key)
		}else{fmt.Println("No Matched Key Found for ",key);exit(0)}
	}
}

func InOrder(root *Node){
	//fmt.Println("IN-ORDER")
	if root.left !=nil {InOrder(root.left)}
	fmt.Printf("%d ",root.value)
	if root.right !=nil {InOrder(root.right)}
}

func PreOrder(root *Node){
	//fmt.Println("PRE-ORDER")
	fmt.Printf("%d ",root.value)
	if root.left !=nil {PreOrder(root.left)}
	if root.right !=nil {PreOrder(root.right)}
}

func PostOrder(root *Node){
	//fmt.Println("POST-ORDER")
	if root.left !=nil {PostOrder(root.left)}
	if root.right !=nil {PostOrder(root.right)}
	fmt.Printf("%d ",root.value)
}
