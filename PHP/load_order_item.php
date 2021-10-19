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



//$CheckSQL = "SELECT a.id,a.user_id,a.total_buy,a.total_item,a.createat,b.order_id,b.user_idb,b.product_id,b.price_by,b.qtyb FROM `user_order` a  INNER join user_order_item b ON a.id=b.order_id where a.user_id='$user_id' "; 

$CheckSQL = "SELECT * FROM `user_order_item` where order_id='$order_id' ";
	 
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