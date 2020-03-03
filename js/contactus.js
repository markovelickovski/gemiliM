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



$("#message_form").submit(function(e) {
	console.log("tuka e");
   e.preventDefault();
   var name = $("#name").val();
   var email = $("#email").val();
   var message = $("#comment").val();
   var d = new Date();
   d=d.toDateString();
	$.ajax({
		type: "POST",
		url: 'php/sendmessage.php',
		data: {name:name, email:email, msg:message, date:d},
		success: function(data)
		{
			console.log(data);
			if(data == "uspesno")
			{
				alert("Message sent successfully!");

			}
			else
			{
				alert("Oops! Something went wrong! Please try again.");

			}
		},
		error: function(err){console.log(err);},
		dataType: 'json' 
	});     

});
