<?php
 include "db.php";

 $which=$_POST['kateg'];
 $q=mysqli_query($con,"SELECT * FROM `products` WHERE `category`= '$which'");
 if($q && mysqli_num_rows($q) > 0){
	$json = mysqli_fetch_all ($q, MYSQLI_ASSOC);
	echo json_encode($json );
}
else echo "nema";

 ?>
