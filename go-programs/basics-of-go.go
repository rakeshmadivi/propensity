package main
import "fmt"

import "time"

const SIZE=99

func declaringvars(){
	// Declaring int variable
	var x int
	x=20

	// Declare and Initialize variable
	var y int = 50	// Declaration & Initialization
	var z=55	// No explicit type declaration
	yz := 60	// Declare and Initialize without using 'var' keyword

	// Multiple values to multiple variables
	var a,b = 70,"Rakesh"

	fmt.Println("x = ",x," y = ",y," z = ",z," yz = ",yz," a = ",a," b = ",b)
}

func loops(){


	var arr1 [SIZE] int

	arr2 := [...] int {1,2,3,4}

	fmt.Println("len(arr1): ",len(arr1)," len(arr2): ",len(arr2))

	for i:=0;i<SIZE;i++ {
		arr1[i] = i;
		//fmt.Print(i)
	}

	fmt.Println("arr1: ",arr1)
	fmt.Println("arr2: ",arr2)

	// SLICE OF AN ARRAY
	var slice [] int = arr1[20:30]
	fmt.Println("SLICE: ",slice)

	// for as while
	x:=0
	while_size:=5
	for x < while_size {
		fmt.Println("while: ",x,"/",while_size)
		x+=1
	}
	
	// for as do-while
	x=0
	for {
		fmt.Println("do-while [",x,"] Doing some work here...")
		if x == 4 {
			fmt.Println("\tReached condition")
			break
		}
		x+=1
	}

	// Case statements
	x=8
	switch x {
	case 1:
		fmt.Println("Case-1")
	case 2:
		fmt.Println("Case-2")
	case 5:
		fmt.Println("Case-5")
	default:
		fmt.Println("Default")
	}
}

func mygoroutine(channel chan<- string){
	fmt.Println("My-goroutine.")

	// Write data to string channel
	channel <- "Hello from mygoroutine."
	//arr := [...] string {"Rakesh","Rajesh"}
	//channel <- arr
}

func testfunctions(){
	// Test Go Channels
	channel_var := make(chan string)
	
	// Test GoRoutine
	go mygoroutine(channel_var)
	fmt.Println("This is after calling goroutine.")
	time.Sleep(2*time.Second)

	//testdata := [...] string {"rak","raj","ram"}
	//channel_var <- "Rakesh" //testdata
	
	// Receive data from string channel
	chan_data:=<-channel_var

	fmt.Println("Got from Channel: ",chan_data)
}
/**************** MAIN FUNCTION ********************/
func main(){
	fmt.Println("My constant: ",SIZE)
	//declaringvars()
	//loops()

	// Testing functions and go routines
	testfunctions()
	

}
