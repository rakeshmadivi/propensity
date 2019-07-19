//usr/bin/env go run "$0" "$@"; exit "$?"
//#! /usr/local/go/bin/go run
package main
import (
	"fmt"
	"os"
	// My Packages
	//"mypackage"
)

func main(){
	fmt.Println("Program arguments: ",os.Args)

	//*********************
	// String OPs
	//sbuild()

	// Struct OPs
	Gostruct()

	// Testing struct Methods (Similar to Class and Functions in OOPs Concepts)
	Names()

	// Many Methods with same name Test
	r := Rectangle{10,10}; c := Circle{10}
	fmt.Println("Rectangle Area = ",r.Area())
	fmt.Println("Circle Area = ",c.Area())
	//***********************/

}
