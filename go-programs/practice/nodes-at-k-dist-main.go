package main

import (
	"fmt"
)

type Node struct{
	val int
	left,right *Node
}

//func nodes_at_k_dist_from(key,dist int){
//}

func insert(node *Node,val int) *Node{
	fmt.Println("Inserting Node:",val)
	if node == nil{
		fmt.Println("\t`--> Creating ROOT")
		//root = &Node{val,nil,nil}
		node = new(Node)
		node.val = val
		node.left = nil
		node.right = nil
		return node
	}
	
	//If it fits in left sub tree
	if node.val > val{
		fmt.Println("\t`--> Going Left of",node.val)
		if node.left != nil{
			node.left = insert(node.left,val)
		}else{
			node.left = &Node{val:val}
		}
	}else{
		fmt.Println("\t`--> Going Right of",node.val)
		if node.right != nil{
			node.right = insert(node.right,val)
		}else{
			node.right = &Node{val:val}
		}
	}
	return node
}

func InOrder(root *Node){
	//fmt.Println("IN-ORDER")
	if root.left !=nil {InOrder(root.left)}
	fmt.Printf("%d ",root.val)
	if root.right !=nil {InOrder(root.right)}
}

func CreateTree(nodes []int) *Node{
	var root *Node
	//nodes := []int{5,3,6,7,89}
	root = insert(root,nodes[0])
	for k,v := range nodes{if k>0{insert(root,v)}}

	//fmt.Println(root,"\nPrinting INORDER")
	//InOrder(root);fmt.Println()

	return root
}

func main(){
	nodes := []int{5,3,6,7,14,89}
	root := CreateTree(nodes)
	fmt.Println("Created Tree with ROOT =",root)
	InOrder(root);fmt.Println()
	//key,dist := 5,2
	//fmt.Println("Nodes at %v distance from %v are:",nodes_at_k_dist_from(key,dist))
}
