<?php
include 'connection.php';

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}


$json = file_get_contents('php://input');

// Decode the received JSON and Store into $obj variable.
$obj = json_decode($json,true);
$order_id = $obj['order_id'];
$status = $obj['status'];


// Checking whether Email is Already Exist or Not in MySQL Table.
$Sql_Query = "UPDATE   `user_order`  set status ='$status'  where id='$order_id'";


	 //echo $Sql_Query;

	 if(mysqli_query($conn,$Sql_Query)){

		$MSG = 'true' ;

		// Converting the message into JSON format.
		$json = json_encode($MSG);

		// Echo the message.
		 echo $json ;

	 }
	 else{

		echo $Sql_Query;

	 }



 mysqli_close($conn)

?>