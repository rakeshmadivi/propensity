package main

import (
	"fmt"
)

/*
Try to create an html document like elements using Go structure
<html>
	<h1> Heading1 </h1>
	<p> Paragraph </p>
</html>
*/

func main(){
	
	// Heading Element
	h1 := Node{htag:"h1", text:"Heading1"}

	// Paragraph Element
	p1 := Node{htag:"p", text:"Paragraph"}

	fmt.Printf("%+v",p1)
	fmt.Println("h1children: ",h1.NofChildren(),"p1Children: ",p1.NofChildren())
	
	// html Element
	html := Node{htag:"html",children:[]*Node{&h1,&p1}}
	//nchildren := len(html.children)
	nchildren := html.NofChildren()
	
	// Print the DOM Structure
	fmt.Println("Tag = ",html.htag,"\nText = ",html.text,"\nLen(Children) = ",nchildren)
	fmt.Printf("Contents: %s\n",html.GetContents(nchildren))
}
