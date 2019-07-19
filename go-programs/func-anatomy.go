import("fmt")

func add(a int,b int) int{
	return a+b
}

func subtract(a int,b int) int{
	return a-b
}

type calctype func(int,int) int

func calc(x int,y int,f calctype)

func main(){

}
