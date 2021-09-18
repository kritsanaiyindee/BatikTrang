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
$CheckSQL = "SELECT * FROM shop_user WHERE email='$email'   and passwordhash= '$passwordHash'"; 
	 
// Executing Email Check MySQL Query.
$check = mysqli_fetch_array(mysqli_query($conn,$CheckSQL)); 
 
// $result = mysqli_query($connection, $sql) or die("Error in Selecting " . mysqli_error($connection));
if(isset($check)){ 
    $sth = mysqli_query($conn,$CheckSQL);
    $rows = array();
    while($r = mysqli_fetch_assoc($sth)) {
    $rows[] = $r;
    }
    echo json_encode($rows);
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