<?php
 include "db.php";


$name=$_POST['name'];
$email=$_POST['email'];
$msg=$_POST['msg'];
$date=$_POST['date'];
$result=mysqli_query($con,"INSERT INTO messages (`user`,`email`,`message`,`timestamp`) VALUES ('$name', '$email', '$msg', '$date')");
	 if($result)
	 {
		 echo ("uspesno");
	 }
	 else
	 {
		 echo ("neuspesno");
	 }



 ?>
