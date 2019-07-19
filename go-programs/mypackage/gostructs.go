//usr/bin/env go run "$0" "$@"; exit "$?"
//#! /usr/local/go/bin/go run
package mypackage
//package main

import (
	"fmt"
	"math"
)

type Name struct{
	fn,ln string
}

//*
func (n Name) fullname() string {
	return n.fn+"--"+n.ln
}
//*/

func Names(){

	// Initialize Name and test it
	name1 := Name{fn:"Mypackage",ln:"Rakesh"}
	fmt.Println("Full Name: ",name1.fullname())
}

// Methods can have same name but Functions shouldnt.
// Example to show Methods can have same name
// Rectangle
type Rectangle struct{l int;b int}
type Circle struct{r int}

// Methods to get area of 2 geometric shapes created above.
func (r Rectangle) Area() int{return r.l*r.b}
func (c Circle) Area() float32{return math.Pi*float32(c.r*c.r)}

type Fields struct{
	f1 string
	f2 int
	f3 bool
}

func Gostruct(){
	// No Order required
	f1 := Fields{f1:"Rakesh",f3:true,f2:123}

	// Order is required to assign values directly
	f2 := Fields{"Rakesh",234,true}
	//f := Fields{"Rakesh",true,234}	// Error as its assigning values to different types

	// print fields
	//fmt.Printf("%#v\n",f1)
	fmt.Printf("f1==> %+v\n",f1)
	fmt.Println("f2==>",f2)
}
