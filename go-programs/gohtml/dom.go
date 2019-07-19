package main

import (
	"fmt"
	"os"
	"strconv"
	//"reflect"
	"bufio"
	"log"
	"time"
)

/*
func GetFunctionName(i interface{}) string {
	    return runtime.FuncForPC(reflect.ValueOf(i).Pointer()).Name()
    }
    */

func exit(ec int){
	os.Exit(ec)
}

func notify(s string){
	fmt.Println(s)
}

/*
Node Structure
Node(parent,{id,name},{tag,text,Children[]})
*/

//identify map[int]string

type Node struct{
	parent *Node
	tag,text string
	children []*Node
}

type node struct{
	p_id int
	tag,text string
}

// Uniq ID to each node
var UNIQ_ID int
var UNIQ_ID_NEXT int

var uniq map[int]*Node	// Create Empty map using make()
//Uniq := make(map[int]*Node)	// Create Empty map using make()
//var Uniq := map[int]*Node{}	// Create Empty map using {}

// Initializing Map
func Initialize(){
	uniq = make(map[int]*Node)
}

// -------------- Utilities ----------------------------
func Info(s string,n Node){
	//fmt.Println("[Info] ----------")
	fmt.Println("[Info]\t",s," ",n)
	//fmt.Println("[End Info] ------")
}
func AddRoot(n node){
	r := &Node{tag:n.tag,text:n.text}
	UNIQ_ID =1
	UNIQ_ID_NEXT = UNIQ_ID+1
	notify("Adding Root Node: "+strconv.Itoa(UNIQ_ID))
	uniq[UNIQ_ID] = r
	fmt.Println("RootNode: ",r)
}

func updateChildrenOf(pid int,c *Node){
	Info("Before:",*uniq[pid])
	// Append the Node c to Parent Children Array
	uniq[pid].children = append(uniq[pid].children,c)
	
	Info("Updated parent:["+strconv.Itoa(pid)+"]",*uniq[pid])
	
	// Print Contents of Children
	Get_ContentsOf(pid)

}

//func AddNode(n *Node){
func AddNode(t node){
	if (t.p_id != 0){
		if _,k := uniq[t.p_id];k{
			UNIQ_ID +=1
			UNIQ_ID_NEXT = UNIQ_ID+1
			nodeid := strconv.Itoa(UNIQ_ID)
			parentid := strconv.Itoa(t.p_id)
			notify("\nAdding: Node-"+nodeid+" -> Parent-"+parentid)
			n := &Node{parent:uniq[t.p_id],tag:t.tag,text:t.text}
			uniq[UNIQ_ID] = n
			fmt.Println(t)

			// Update the children in parent
			updateChildrenOf(t.p_id,n)
		}else{
			fmt.Println("Error: No Parent with given id exists.")
			exit(1)
		}
	}else{
		fmt.Println("Error: Please provide parent id.")
		exit(1)
	}
}

func Get_NofNodes()int{
	return len(uniq)
}

func (n Node) Get_NofChildren() int{
	return len(n.children)
}

func Get_ContentsOf(id int){
	nc := len(uniq[id].children)
	fmt.Printf("[Node-%d] Parent = %v, Tag = %s, Text = %s, No.of Children = %d\n",id,uniq[id].parent,uniq[id].tag,uniq[id].text,nc)
	
	// Print Children Data
	for i:=0; i<nc; i++{
		fmt.Printf("\t`- [Child-%d] %+v\n",i,uniq[id].children[i])
	}
}

func PrintNodes(){
	fmt.Println("\nAll Nodes:")
	for k,v := range uniq{
		fmt.Printf("[(%p)] %d %+v\n",v,k,v)
		//fmt.Println(k,v)
	}
}

func preSetNodes(){
	AddRoot(node{tag:"h1",text:"Root Node"})
	
	for i,parentid:=0,1;i<5; i,parentid = i+1,parentid+1{
		num:=strconv.Itoa(UNIQ_ID_NEXT)
		AddNode(node{p_id:parentid,tag:"C"+num,text:strconv.Itoa(parentid)+"<-"+num})
		time.Sleep(100*time.Millisecond)
	}
}

func ReadNodesFromUser(){
	//var n node;
	var pid int;
	var tag,text string
	//var confirm byte

	scanner := bufio.NewScanner(os.Stdin)
	fmt.Println("Do you want to add node? ")
	for scanner.Scan(){
		if scanner.Text() == "y"{
			if len(uniq) != 0{
				fmt.Println("Enter Child Node Details ");
				fmt.Println("Enter [ Parent-id Tag Text ] (separated by space) : "); fmt.Scanf("%d %s %s\n",&pid,&tag,&text)
				AddNode(node{p_id:pid,tag:tag,text:text})

			}else{
				fmt.Println("Enter Root Node Details ");
				fmt.Println("Enter [ Tag Text ] (separated by space) : "); fmt.Scanf("%s %s\n",&tag,&text)
				AddRoot(node{tag:tag,text:text})
			}
		}else{
			if len(uniq) != 0{
				PrintNodes()
				exit(0)
			}else{
				fmt.Println("No Nodes to print.")
				exit(0)
			}
		}
		// Text for next entry
		fmt.Println("Do you want to add node? ")
	}
}

func ReadFromFile(f string){
	//*
	file,err := os.Open(f)
	if err != nil{
		panic(err)
	}

	// Reading to
	var pid int
	var tag,text string

	fmt.Fscan(file,&pid,&tag,&text)
	//if fmt.Fscanln(file,&pid,&tag,&text){
		fmt.Println("ReadFromFile: ",pid,tag,text)
	//}
	// You might want to defer closing file
	file.Close()
	//*/
}

func ReadFromFile_v2(f string){
	// Version -2
	//*
	file, err := os.Open(f)
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()

	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		fmt.Println(scanner.Text())
	}

	if err := scanner.Err(); err != nil {
		log.Fatal(err)
	}
	//*/
}

//---------------- Sample Pointer Operation ---------------
func SamplePointer(){
	notify("In SamplePointer")
	//a := []int{1,2,3}
	//x := &a
	//fmt.Println(a,x)

	sampleN := Node{tag:"Sample",text:"MySample"}
	var m map[int]*Node
	m = make(map[int]*Node)
	m[0]=&sampleN
	
	fmt.Println("Map = ",m)
	fmt.Println("Len(m) = ",len(m),"Value: ",m[0].tag)
}

func Funlogic(){
	m := make(map[int]int)
	for i:=0;i<5;i++{
		m[i] = i+10 
	}

	check:=4	// Check id
	// Check for Existence in map
	if k,ok := m[check];ok{
		fmt.Printf("[%d] %d is present\n",check,k)
	}else{
		fmt.Println(check,"Is NOT Present")
	}

	// Iterating over map items
	for k,v := range m{
		fmt.Println(k,v)
	}
	fmt.Println("No.of Keys = ",len(m))

	// Appending
	x := []Node{}
	x1 := Node{tag:"x1x2",text:"x1x2text"}
	x2 := x1
	x = append(x,x1,x2)
	//x = append()
	fmt.Println("After Appending: ",x)
}

