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
// Getting name from $obj object.
$email = $obj['email']; 
// Getting Email from $obj object.
$passwordHash = $obj['password']; 
// Checking whether Email is Already Exist or Not in MySQL Table.
$CheckSQL = "SELECT * FROM shop_user WHERE email='$email'   "; 
	 
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
  $emailExist = 'false';	 
	 // Converting the message into JSON format.
	$existEmailJSON = json_encode($emailExist);	 
	// Echo the message on Screen.
	 echo $existEmailJSON ; 
	 
 }
 
 mysqli_close($conn)
 
?>