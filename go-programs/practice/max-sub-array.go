package main

import (
	"fmt"
)

func Max(x,y int)int{
	if x > y{return x}else{return y}
}

func Min(x,y int)int{
	if x < y{return x}else{return y}
}

func subarray(a []int){
	pmax,pmin,ans := 1,1,1
	var from,to int

	for i:=0;i<len(a);i++{
		if a[i] == 0{
			pmax,pmin,ans = 1,1,1
			from,to = i+1,i+1
			fmt.Println("Next from&to:",from,to)
			continue
		}
		fmt.Printf("[%v] pmax = %v pmin = %v CurrentElement = %v\n",i,pmax,pmin,a[i])
		new_max := pmax * a[i]
		new_min := pmin * a[i]
		max_cur := Max(Max(pmax,new_max),a[i])
		min_cur := Min(Min(pmin,new_min),a[i])
		pmax = max_cur; pmin = min_cur
		fmt.Printf("\t`-->[%v] pmax = %v pmin = %v CurrentElement = %v\n",i,pmax,pmin,a[i])

		ans = Max(max_cur,pmax)
		fmt.Printf("\t[Answer@ %v] %v\n",i,ans)
	}
}

func main(){
	a := []int{-1,6,2,0,7,9}
	subarray(a)
}
