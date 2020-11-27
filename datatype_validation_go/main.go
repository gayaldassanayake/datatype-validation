package main

import (
	"database/sql"
	"fmt"
	"log"
	"time"

	_ "github.com/godror/godror"
)

// oracle:thin:@//localhost:1521/ORCLCDB.localdomain", "admin", "password

func main() {

	db, err := sql.Open("godror", `user="admin" password="password" connectString="//localhost:1521/ORCLCDB.localdomain"`)
	if err != nil {
		log.Fatal(err)
	}

	if err = db.Ping(); err != nil {
		log.Fatal("Error connecting to the database\n", err)
	}

	timeOperations(db)

	defer db.Close()

}

func timeOperations(db *sql.DB) {

	type TimeStruct struct {
		// colDate       string
		// colTimestamp1 time.Time
		// colTimestamp2 time.Time
		// colTimestamp3 time.Time
		colIntervalYearToDate   string
		colIntervalDateToSecond string
	}

	// selectQuery := `select col_interval_year_to_month, col_interval_day_to_second from datetime`

	// rows, err := db.Query(selectQuery)

	// if err != nil {
	// 	log.Fatal("Error fetching data\n", err)
	// }
	// defer rows.Close()

	// var r TimeStruct

	// for rows.Next() {
	// 	// fmt.Println(rows)
	// 	rows.Scan(&r.colIntervalYearToDate, &r.colIntervalDateToSecond)

	// 	fmt.Println(r.colIntervalYearToDate)
	// 	fmt.Println(r.colIntervalDateToSecond)
	// }

	var date time.Time = time.Now()
	var ytom string = "12-05"
	var dtos string = "200 05:12:10.222000"

	insertQuery := `insert into datetime(col_date, col_timestamp_1, col_timestamp_2, col_timestamp_3, 
				col_interval_year_to_month, col_interval_day_to_second) values (:1, :2, :3, :4, :5, :6)`

	stmt, err := db.Prepare(insertQuery)
	
	if err != nil {
		fmt.Println("Error preparing statement\n", err)
	}

	res, err := stmt.Exec(date, date, date, date, ytom, dtos)
	// res, err := db.Exec(1, date, date, date, ytom, dtos)

	if err != nil {
		fmt.Println("Error inserting data\n", err)
	} else {
		fmt.Println(res)
	}

}
