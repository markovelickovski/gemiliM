var croppedimg;
var loggeduser;
$( document ).ready(function() {

	var tempuser = sessionStorage.getItem("loggeduser");
	console.log(tempuser);
	if (tempuser == "undefined" || tempuser == undefined || tempuser == null || tempuser == "null")
	{
		$(".login_mb").removeClass("hidden");
		$(".llink").addClass("hidden");
	}
	else
	{
		console.log("vleze");
		loggeduser = tempuser;
		$(".login_mb").addClass("hidden");
		$(".llink").removeClass("hidden");
		$(".modal").removeClass("visible");
		
	}
});




