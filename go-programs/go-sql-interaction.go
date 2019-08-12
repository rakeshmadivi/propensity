package main
// Import required libraries for SQL
import (
	"database/sql"
	_ "github.com/go-sql-driver/mysql"
	"fmt"
)


func main(){
	// Open SQL Connection

	db,err := sql.Open("mysql","root:root@tcp(127.0.0.1:3306)/sys")
	if err != nil{
		panic(err.Error())
	}
	// Perform a DB Query
	results,err := db.Query("show tables;")

	//fmt.Println(sel,"-DONE-")

	for results.Next(){
		var result string
		err = results.Scan(&result)
		if err != nil{
			panic(err.Error())
		}
		fmt.Println("Final Result:",result)
	}

	defer db.Close()
}

