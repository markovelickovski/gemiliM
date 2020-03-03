<?php
 include "db.php";

 $id=$_POST['userid'];
 $q=mysqli_query($con,"SELECT * FROM `users` WHERE `account_no`= '$id'");
 if($q && mysqli_num_rows($q) > 0){
	$json = mysqli_fetch_all ($q, MYSQLI_ASSOC);
	echo json_encode($json );
}
else echo "nema";

 ?>
