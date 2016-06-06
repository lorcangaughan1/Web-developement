<?php
$servername = "localhost";
	$username = "root";
	$password = "";
	$dbname = "myDB";
$q = $_REQUEST["q"];
// Create connection
$conn = mysqli_connect($servername, $username, $password);
// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
function When(){
	// get the data from the form
	$q = $_REQUEST["q"];
	//send result to database
	$sql = "INSERT INTO myDB (Where)
	VALUES ('$q')";

	if (mysqli_query($conn, $sql)) {
		echo "New record created successfully";
	} else {
		echo "Error: " . $sql . "<br>" . mysqli_error($conn);
	}
	
mysqli_close($conn);
?>