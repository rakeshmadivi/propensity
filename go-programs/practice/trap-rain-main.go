/*--------------------------------*/
/*
Test-1 {3,0,4,0,2,0,0,3,0,1}
  1 
1 1    1
1 1 1  1
1_1_1__1_1

Test-2 {6,0,4,0,0,3,0,5,0,6}
1        1
1      1 1
1 1    1 1
1 1  1 1 1
1 1  1 1 1
1_1__1_1_1

*/
/*--------------------------------*/
package main

import (
	"fmt"
)
func Abs(x int,y int)int{
	val:=x-y
	if val<0{
		return -val
	}else{
		return val
	}
}

func Min(x int,y int)int{
	if x<y{return x}else{return y}
}

func trap(a []int) (units int){
	var init int

	alen := len(a)
	init = -1;
	var prev int

	// For tracking current region
	czeros:=0	// Count zeros till next init
	max := -1	//_till_next_init :=-1
	cunits := 0

	for i:=0; i<alen;i++{
		//if i == alen-1{units+=cunits;fmt.Printf("\n=== [REACHED END WALL] ===\nTotal Units = %v\n",units)}

		if i!=alen-1 && a[i] == 0{
			czeros++;
			fmt.Printf("i = %v\t=> init:%v prev:%v czeros:%v cunits:%v\n",i,init,prev,czeros,cunits)
			continue
		}

		if a[i] > 0{
			// Initialize first non-zero value to init; Re-initialize zero to 0.
			if init == -1{
				init = a[i]
				czeros=0
				prev = i
				fmt.Println("\n=== [Started Filling from:",i,"] ===")
			}

			// Print Current values
			fmt.Println("\ni = ",i,"[Value =",a[i],"];Init = ",init,";Prev = ",prev,"(a[",prev,"]=",a[prev],")")


			// If we encounter lesser value
			if a[i] < init{
				fmt.Printf("\t[i=%v] init:%v max:%v prev:%v czeros:%v cunits:%v Total_Units:%v\n",i,init,max,prev,czeros,cunits,units)
				// Set Max till next init
				if max == -1{
					max = a[i]
					cunits+=czeros*a[i]
				}else if max < a[i]{
					// Update Max to new value 
					max = a[i]
					// get czeros and update new cunits value
					cunits = czeros*a[i]
				}else{
					fmt.Println("\t[",i,"(Non Max=-1)",i-(prev+1),"*",a[i],"]")
					cunits+=(i-(prev+1))*a[i]
					//fmt.Println("CUNITS===> ",cunits)
				}
				//units+=cunits
				prev = i
				fmt.Printf("\t\t||\n\t[i=%v] init:%v prev:%v czeros:%v cunits:%v Total_Units:%v\n",i,init,prev,czeros,cunits,units)
			}

			// If we encounter bigger value
			if a[i] >= init{
				fmt.Println("\t[Reached New Init] Total Units till Now = ",cunits,units)
				// will encompass all values at init height from init->here.
				fmt.Printf("\t[i=%v] init:%v prev:%v czeros:%v cunits:%v Total_Units:%v\n",i,init,prev,czeros,cunits,units)
				cunits = czeros*init;
				units += cunits; fmt.Println("\t[Updated] Total Units =",units)

				// update init to new value
				init = a[i]

				// Update all Current region tracking variables to initial values
				czeros = 0; prev = i; max = -1; cunits = 0
				fmt.Printf("\t\t||\n\t[i=%v] init:%v prev:%v czeros:%v cunits:%v Total_Units:%v\n",i,init,prev,czeros,cunits,units)
			}
		}
		if i == alen-1{units+=cunits;fmt.Printf("\n=== [REACHED END WALL] ===\nTotal Units = %v\n",units)}
	}
	return units
}

func trap2(a []int)(units int){
	lo,hi := 0,len(a)-1
	lmax,rmax := 0,0
	result:=0
	for ;lo<=hi; {
		if a[lo]<a[hi]{
			if a[lo] > lmax{
				lmax=a[lo]
			}else{
				result+=lmax-a[lo]
				lo++
			}
		}else{
			if a[hi] > rmax{
				rmax=a[hi]
			}else{
				result+=rmax-a[hi]
				hi--
			}
		}
	}
	return result
}

func main(){
	//t := []int{0,0,3,0,4,0,2,0,0,3,0,1}	//=>13
	//t := []int{1,0,6,0,3,0,1,0,4,0,5}	// =>21
	//t := []int{0,0,2,0,4,0,5,0,0,0,2,0,0,0}	//=>12
	//t := []int{0,0,6,0,1,0,7,0,0,0,9,0}	//=>33
	//t := []int{6,0,4,0,0,3,0,5,0,6}	//=>30
	t := []int{0,1,0,2,1,0,1,3,2,1,2,1}

	fmt.Println("[TRAP] Totals Units Trapped:",trap(t))
	fmt.Println("[TRAP-2] Totals Units Trapped:",trap2(t))
}
