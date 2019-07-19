package main
import ("fmt")

func check_preorder(a []int,size int){
	/*
	PREORDER: ROOT,LEFT,RIGHT
	first element would be ROOT of the tree
	*/
	root := a[0]
	
	for i := 1; i< size; {
		//goback := a[i]
		
		// RHS
		if a[i] > root {
			fmt.Println("[",i,"] RHS: ",a[i])
		}else if a[i] < root{	// LHS
			fmt.Println("[",i,"] LHS: ",a[i])
		}else{
			fmt.Println("NONE")
		}
		i++
	}
}

func main(){
	input := []int{23,45,66,17}
	fmt.Println("ORIGINAL",input)
	check_preorder(input,len(input))
}
