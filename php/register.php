<?php
include "db.php";
$fname=$_POST['firstname'];
$lname=$_POST['lastname'];
$uname=$_POST['username'];
$email=$_POST['email'];
$pass=$_POST['password'];
$address=$_POST['address'];
$image=$_POST['image'];
 $q=mysqli_query($con,"SELECT * FROM users WHERE `email`='$email' OR `username`='$uname'");
 if($q)
 {
 
 if(mysqli_num_rows($q) > 0){
	 
		 echo json_encode("postoi");
}
 else	
 {	
	if(isset($_POST["image"]))
	{
 		$image_array_1 = explode(";", $image);

 		$image_array_2 = explode(",", $image_array_1[1]);

 		$data = base64_decode($image_array_2[1]);

		 $imageName = '../uploads/' . $uname . '.png';
		 $imagedbName = 'uploads/' . $uname . '.png';

 		file_put_contents($imageName, $data);
	}
	else
	$imagedbName = '../IMG/def_img.png';

	 $result=mysqli_query($con,"INSERT INTO users (`name`,`lastname`,`username`,`email`,`password`,`address`, `image`, `history`,`token`) VALUES ('$fname', '$lname', '$uname', '$email', '$pass', '$address','$imagedbName','{}' , '0')");
	 if($result)
	 {
		 echo json_encode("uspesno");
	 }
	 else
	 {
		 echo json_encode("neuspesno");
	 }
 }
 }
 else echo json_encode("nepomina");

 ?>
