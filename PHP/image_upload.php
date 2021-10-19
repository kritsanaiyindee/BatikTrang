<?php
 $json = file_get_contents('php://input');

// Decode the received JSON and Store into $obj variable.
$obj = json_decode($json,true); 
$image = $obj['image'];
$name = $obj['name'];

   // $image = $_POST['image'];
//    $name = $_POST['name'];
    $realImage = base64_decode($image);
 
    file_put_contents($name, $realImage);
 
    echo "Image Uploaded Successfully.";
 
?>