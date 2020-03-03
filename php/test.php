<?php
 include "db.php";


$passret = mysqli_query($con,"SELECT * FROM users");


if($passret && mysqli_num_rows($passret) > 0)
{
	$passwod = mysqli_fetch_assoc($passret);
	echo json_encode($passwod);
 }
else 
{
	echo json_encode("nema");
}

 ?>
