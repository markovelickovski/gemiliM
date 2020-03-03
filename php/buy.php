<?php
include "db.php";

$uid=$_POST['userid'];
$newhist=$_POST['newhist'];

$q=mysqli_query($con,"UPDATE `users` SET `history`='$newhist' WHERE `account_no`='$uid'");
if($q)
{
	echo json_encode("uspesno");
}
else echo json_encode("neuspesno");

 ?>