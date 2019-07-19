package main
import (
	"fmt"
	"os"
	"os/exec"
	"log"
	"strings"
	"bytes"
	"runtime"
)

func errorlog(e error){
	if e != nil{
		log.Fatal(e)
	}
}

func t0(){
	cmd := exec.Command("tr", "a-z", "A-Z")
	cmd.Stdin = strings.NewReader("some input")
	var out bytes.Buffer
	cmd.Stdout = &out
	err := cmd.Run()
	if err != nil {
		log.Fatal(err)
	}
	fmt.Printf("in all caps: %q\n", out.String())
}

func t1(){
	cmd := exec.Command("sh","-c","echo TESTING; echo Hyderabadi > t1.output 2>&1")
	/*
	err := cmd.Run()
	if err != nil {
		log.Fatal(err)
	}
	*/
	out,e := cmd.Output()
	errorlog(e)
	fmt.Println(string(out))
}

func t2(){
	cmd := exec.Command("ls", "-l")
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	err := cmd.Run()
	errorlog(err)
	//fmt.Println()
}

func execute(){

	// calling t1()
	fmt.Println("Calling t1()")
	t1()

	fmt.Println("Calling t2()")
	t2()
}

func main(){
	if runtime.GOOS == "windows"{
		fmt.Println("Cannot Run the commands on Windows System.")
	}else{
		execute()
	}
}
