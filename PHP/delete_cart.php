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
$id = $obj['id'];
$Sql_Query = " delete   from `user_cart_item` where id ='$id'"; 
	 
	 //echo $Sql_Query;
	 
	 if(mysqli_query($conn,$Sql_Query)){
	 
		 // If the record inserted successfully then show the message.
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