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
$user_id = $obj['user_id'];
$total_buy = $obj['total_buy'];
$total_item = $obj['total_item'];

// Checking whether Email is Already Exist or Not in MySQL Table.
$Sql_Query = "INSERT INTO `user_order` (`id`, `user_id`, `total_buy`, `total_item`, `updateat`, `createat`, `status`) VALUES (NULL, '$user_id', '$total_buy', '$total_item', CURDATE(), CURDATE(),0);";


	 //echo $Sql_Query;

	 if(mysqli_query($conn,$Sql_Query)){
	    $last_id = $conn->insert_id;
        //echo "New record created successfully. Last inserted ID is: " . $last_id;
		 // If the record inserted successfully then show the message.
		$MSG = $last_id ;

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