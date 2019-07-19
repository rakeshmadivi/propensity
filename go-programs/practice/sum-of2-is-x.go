package main

import(
	"fmt";//"os"
	//"time";
	//"math/rand"
)

func sumof2isx_v2(a []int,sum int){
	ignore := []int{}	// Store matched indices
	var consider []int	// Stire non matched indices

	fmt.Println("Input: ",a,"\nSUM:",sum)
	size:=len(a)
	for i:=0;i<size;i++{consider=append(consider,i)}	// Initialize considering indices
	//for i:=0; i<size; i++{
	for i:=0;i<size && len(consider)>1;i++{
		if len(consider) != 0{
			cid0 := consider[0]
			valcheck:=sum-a[cid0]
			fmt.Println("\nIteration:",i,"\n\tConsider Indices:",consider)
			fmt.Println("\tIgnore Indices:",ignore)
			fmt.Println("\tVALUE:",a[cid0],"ValCheck:",valcheck)
			tcids:=[]int{}

			// If even after 
			if i==size-1 && len(consider)==size {fmt.Println("Could not find any combination that SUMs to",sum);break}
			clength := len(consider)
			for cid,fnd,nfnd:=1,0,0;cid<clength;cid++{
				aid := consider[cid]
				if a[aid] == valcheck{
					fnd++
					fmt.Println("Found @ a[",aid,"] =",a[aid])
					fmt.Println("\t+++Adding",aid,"to ignore[]")
					ignore = append(ignore,aid)
					//time.Sleep(2*time.Second)
				}else{
					nfnd++
					fmt.Println("\t--Adding",aid,"=> consider[]")
					tcids = append(tcids,aid)
				}
				if cid == clength-1 {
					if fnd>0{
						fmt.Println("\t+++Adding",consider[0],"=> ignore[]")
						ignore=append(ignore,consider[0])
					}
					// If match not found till the end, Include consider[0] value again to considering indices
					if nfnd == cid{
						fmt.Println("\t[i,nfnd =",i,nfnd,"] Not Found Till End of Consider[]")
						fmt.Println("\t--Adding",consider[0],"=> consider[]")
						tcids=append(tcids,consider[0])
					}

				}
			}
			consider = tcids
		}
	}

	ilength:=len(ignore)
	if ilength >0 {
		for i:=0;i<ilength;i+=2{
			aid1 := ignore[i+1]
			aid2 := ignore[i]
			fmt.Printf("(%d,%d) %v + %v = %v\n",aid1,aid2,a[aid1],a[aid2],a[aid1]+a[aid2])
		}
	}
}

func sumof2isx(a []int,sum int){
	// Map to store values results to sum
	matched := make(map[int][]int)
	//matchedidx := make(map[int][]int)
	for{
		var unmatch []int

		// For each element in input array
		unmatch = a
		size := len(unmatch)
		if size==0 {break}
		fmt.Println("NEW ARRAY:",unmatch)
		key := unmatch[0]
		value:= sum-key	//unmatch[0]

		fmt.Println("CHECKING:",value,"IN",unmatch)

		// Temporary array to store unmatched values
		temp := []int{}

		for i2 := 1; i2<len(unmatch);i2++{
			fmt.Println("Checking If",unmatch[i2],"==",value,"?")
			if unmatch[i2] == value{
				//Append values to result array
				//res = append(res,unmatch[i2])
				matched[key] = append(matched[key],unmatch[i2])
				//matchedidx[key] = append(matchedidx[key],i2)
			}else{
				// Add unmatched values to temp
				//fmt.Println("\tAdding",unmatch[i2],"to temp[]")
				temp = append(temp,unmatch[i2])
				//fmt.Println("\ttemp after adding:",temp)
			}
		}
		//Matched till now
		fmt.Println("\tMatched till now:",matched)
		// make temp as new array
		a = temp
	}
	if len(matched) == 0{fmt.Println("None resulted in Sum = ",sum)}else{
		for k,v:=range matched{fmt.Println(k,v)}
	}
}

func main(){
	//a := []int{0,1,2,3,4,5,6,3,6,4,7}
	
	//sumof2isx(a,7)
	
	/*/ Generate Random Input for array
	s1 := rand.NewSource(time.Now().UnixNano())
	r1 := rand.New(s1)
	var arr []int
	var arr_length=12
	for i:=0;i<arr_length;i++{arr=append(arr,r1.Intn(100))}
	sumof2isx_v2(arr,arr[3]+arr[5])
	*/
	// Test Case: 53,21,27,87,30,0,39,20,67,50,37,95
	a := []int{53,21,27,87,30,0,39,20,67,50,37,95}
	sumof2isx_v2(a,87)
}
