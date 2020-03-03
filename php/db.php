<?php

$servername = "localhost";
$username = "root";
$password = "";
$tablename = "gemili";



$con = new mysqli($servername, $username, $password, $tablename);

 if ($con->connect_error) {
    die("Connection failed: " . $con->connect_error);
} 
echo "";
 ?>
