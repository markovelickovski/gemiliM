<?php
 include "db.php";


$uname=$_POST['user'];
$pass=$_POST['pass'];
$q = mysqli_query($con,"SELECT * FROM users WHERE `username`='$uname'");

if($q && mysqli_num_rows($q) > 0)
{
			$data = $q->fetch_assoc();
			$logintoken = bin2hex(random_bytes(10));
			$vars = new StdClass();
			$vars->account_no = $data['account_no'];
			$vars->username = $data['username'];
			$vars->token = $logintoken;
			$smeni = mysqli_query($con,"UPDATE users SET `token`='$logintoken' WHERE `username`= '$uname'");
			echo json_encode($vars);
 }
else 
{
	echo ("nema");
}
 ?>
