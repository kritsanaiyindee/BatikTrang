<?php
$servername = "localhost";
$username = "id17601062_u509819093_batiktranguser";
$password = "|ZnG!1ro{-dmDsIZ";
$dbname = "id17601062_u509819093_batiktrangdb";


//u509819093_batiktrangdb
//u509819093_batiktranguser
//|ZnG!1ro{-dmDsIZ

   if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
        header('Access-Control-Allow-Origin: *');
        header('Access-Control-Allow-Methods: POST, GET, DELETE, PUT, PATCH, OPTIONS');
        header('Access-Control-Allow-Headers: token, Content-Type');
        header('Access-Control-Max-Age: 1728000');
        header('Content-Length: 0');
        header('Content-Type: text/plain');
        die();
    }

    header('Access-Control-Allow-Origin: *');
    header('Content-Type: application/json');
    
?>