package main

import (
	"fmt";//"os"
	"io/ioutil"
	"log"
	"time"
	"bufio";"os"
)
func scanner() {
	scanner := bufio.NewScanner(os.Stdin)
	for scanner.Scan() {
		fmt.Println(scanner.Text()=="rakesh")
		fmt.Println("Enter your text:")
	}
}

func fileops(){
	f := "./read-data.txt"

	// Write Message to file
	// format: 0-MM-DD-YYY; 1-YYYY-
	format := []string{"01-02-2006","02-01-2006","2006-02-01","2006.02.01 15:04:05"}
	//message := []byte(time.Now().String())
	message := []byte(time.Now().Format(format[1]))
	err := ioutil.WriteFile(f, message, 0644)
	if err != nil {
		log.Fatal(err)
	}

	// Read the file contents
	contents,err := ioutil.ReadFile(f)
	if err != nil{
		log.Fatal(err)
	}
	fmt.Println("File Contents:\n",string(contents))
}

func main(){
	var name string
	var age int
	/*
	if _, err := fmt.Scan(&name, &age); err != nil {
	        fmt.Println(err)
		        os.Exit(1)
		}
	fmt.Printf("Your name is: %s\n", name)
	fmt.Printf("Your age is: %d\n", age)
	*/
	fmt.Print("Enter name: ");fmt.Scanf("%s\n",&name)
	fmt.Print("Enter Age: ");fmt.Scanf("%d\n",&age)
	fmt.Println(name,age)

	// File Ops
	fileops()

	// Reading input from console
	scanner()
}
