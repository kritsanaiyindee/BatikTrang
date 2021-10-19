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
$user_id = $obj['user_id'];
$product_id = $obj['product_id'];
$price_by = $obj['price_by']; 
$qty = $obj['qty']; 

// Checking whether Email is Already Exist or Not in MySQL Table.
$Sql_Query = "INSERT INTO `user_order_item` (`id`, `order_id`, `user_id`, `product_id`, `price_by`, `qty`, `updateat`) VALUES (NULL, '$order_id','$user_id', '$product_id', '$price_by', '$qty', CURDATE());"; 
	 
	 
	 //echo $Sql_Query;
	 
	 if(mysqli_query($conn,$Sql_Query)){
	    //$last_id = $conn->insert_id;
        //echo "New record created successfully. Last inserted ID is: " . $last_id;
		 // If the record inserted successfully then show the message.
		$MSG = "true" ;
		 
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