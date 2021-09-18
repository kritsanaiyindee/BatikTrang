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

$email = $obj['email']; 
$password = $obj['password']; 
$firstname = $obj['firstname']; 
$lastname = $obj['lastname']; 
$mobile = $obj['mobile']; 
$address = $obj['address']; 
$admin = $obj['admin']; 
$vendor = $obj['vendor']; 





// Checking whether Email is Already Exist or Not in MySQL Table.
$CheckSQL = "SELECT * FROM shop_user WHERE email='$email'"; 
	 
// Executing Email Check MySQL Query.
$check = mysqli_fetch_array(mysqli_query($conn,$CheckSQL)); 
 
if(isset($check)){ 
	 $emailExist = 'true';	 
	 // Converting the message into JSON format.
	$existEmailJSON = json_encode($emailExist);	 
	// Echo the message on Screen.
	 echo $existEmailJSON ; 
 
  }
 else{
 
	 // Creating SQL query and insert the record into MySQL database table.
	 $Sql_Query = "insert into shop_user (firstname,lastname,email,mobile,passwordhash,admin,vendor,registeredat,lastlogin) values ('$firstname','$lastname','$email','$mobile','$password',0,0,CURDATE(),CURDATE())";
	 
	 
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
	 
 }
 
 mysqli_close($conn)
 
?>