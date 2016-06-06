<?php
	$servername = "localhost";
	$username = "root";
	$password = "QKpVdX5zTPUmASMw";
	$dbname = "myDB";

	// Create connection


	$conn = mysqli_connect($servername, $username, $password);
	// Check connection
	if (!$conn) {
		die("Connection failed: " . mysqli_connect_error());
	}
	// Create database
	$sql = "CREATE DATABASE myDB";
	if (mysqli_query($conn, $sql)) {
		echo "Database created successfully";
	} else {
		echo "Error creating database: " . mysqli_error($conn);
	}

	// Create connection
	$conn = mysqli_connect($servername, $username, $password, $dbname);
	// Check connection
	if (!$conn) {
		die("Connection failed: " . mysqli_connect_error());
	}

	function When(){
	// get the data from the form
	var fname = document.getElementById("When").value;
	// the rest of your code is here
	//send result to database
	$sql = "INSERT INTO myDB (When)
	VALUES ('fname')";

	if (mysqli_query($conn, $sql)) {
		echo "New record created successfully";
	} else {
		echo "Error: " . $sql . "<br>" . mysqli_error($conn);
	}

	mysqli_close($conn);
?> 