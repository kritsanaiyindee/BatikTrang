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
$shopid = $obj['shopid'];
$name = $obj['name'];
$description = $obj['description'];
$code = $obj['code'];
$image_url = $obj['image_url'];
$price = $obj['price'];
$rating = $obj['rating'];
$isFavourite = $obj['isFavourite'];
$isready = $obj['isready'];



// Checking whether Email is Already Exist or Not in MySQL Table.
$Sql_Query = "update `product`   set  `name`='$name', `description`='$description', `image_url`='$image_url', `price`='$price'   where id='$id'";


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

		echo 'Try Again';

	 }



 mysqli_close($conn)

?>