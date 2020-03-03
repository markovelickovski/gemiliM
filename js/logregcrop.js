var croppedimg;

$(".login_mb").click(function(e){
	e.preventDefault();
	$(".modal").addClass("visible");
  });

$(".logout_mb").click(function()
{
	sessionStorage.removeItem("loggeduser");
	$(".llink").addClass("hidden");
	$(".login_mb").removeClass("hidden");
});

  $(".close").click(function(){
	$(".modal").removeClass("visible");
  });
  
 /* $(document).click(function(event) {
	if (!$(event.target).closest(".modal,.login_mb").length && !$("#croppieModal").hasClass("visible")) {
	  $("body").find(".modal").removeClass("visible");
	}
  });*/

  $("#login_tab").click(function(e){
	e.preventDefault();
	$("#login_tab").addClass("tab_clicked");
	$("#login_tab").removeClass("tab");
	$("#register_tab").addClass("tab");
	$("#register_tab").removeClass("tab_clicked");
	$("#register_tab_view").addClass("hidden");
	$("#login_tab_view").removeClass("hidden");
	

  });
  $("#register_tab").click(function(e){
	e.preventDefault();
	$("#register_tab").addClass("tab_clicked");
	$("#register_tab").removeClass("tab");
	$("#login_tab").addClass("tab");
	$("#login_tab").removeClass("tab_clicked");
	$("#login_tab_view").addClass("hidden");
	$("#register_tab_view").removeClass("hidden");

  });

$("#log_btn").click(function(e)
{
	
	e.preventDefault();
	var uname = $("#l_username").val();
	var pass = $("#l_password").val();
	$.ajax({
		type: "POST",
		url: 'php/login.php',
		data: {user:uname, pass:pass},
		success: function(data)
		{
			console.log(data);
			if(data !== "nema")
			{
				loggeduser = data;
				sessionStorage.setItem("loggeduser", JSON.stringify(data));
				$(".login_mb").addClass("hidden");
				$(".llink").removeClass("hidden");
				$(".modal").removeClass("visible");
			}
		},
		error: function(err)
		{
			console.log(err);
		},
		dataType: 'json' 
	});        
});



$("#register_form").submit(function(e)
{
	e.preventDefault();
	var fname = $("#r_firstname").val();
	var lname = $("#r_lastname").val();
	var uname = $("#r_username").val();
	var email = $("#r_email").val();
	var pass = $("#r_password").val();
	var repass = $("#r_repassword").val();
	var address = $("#r_address").val();
	if(pass != repass)
	{
		alert("Passwords do not match!");
		return;
	}

	$.ajax({
		type: "POST",
		url: 'php/register.php',
		data: {firstname:fname, lastname:lname, username:uname, email:email, password: pass,address:address, image: croppedimg},
		success: function(data)
		{
			if(data == "uspesno")
			{
				alert("Successfully registered! You can now log in.");
				$("#login_tab").addClass("tab_clicked");
				$("#login_tab").removeClass("tab");
				$("#register_tab").addClass("tab");
				$("#register_tab").removeClass("tab_clicked");
				$("#register_tab_view").addClass("hidden");
				$("#login_tab_view").removeClass("hidden");
			}
			else if(data == "neuspesno")
			{
				alert("Oops! Something went wrong. Please try again.");
			}
			else if(data == "neuspesno" || data == "nepomina")
			{
				alert("Oops! Something went wrong. Please try again.");
			}
			else if(data == "postoi")
			{
				alert("Oops! It seems the username or email already exists. Please try something else.");
			}

		},
		dataType: 'json' 
	});        
});



// CROPPIE MODAL

var modal = document.getElementById("croppieModal");

window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
$image_crop = $('#image_crop').croppie({
    enableExif: true,
    viewport: {
      width:300,
      height:300,
      type:'square' 
    },
    boundary:{
      width:400,
      height:400
    }
  });

  $('#r_image').on('change', function(){
    var reader = new FileReader();
    reader.onload = function (event) {
      $image_crop.croppie('bind', {
        url: event.target.result
      }).then(function(){
        console.log('Bind complete');
      });
    }
    reader.readAsDataURL(this.files[0]);
    $('#croppieModal').addClass("visible");
  });

  $('#crop_image').click(function(e){
	  console.log("vleze");
	  e.preventDefault();
    $image_crop.croppie('result', {
      type: 'canvas',
      size: 'viewport'
    }).then(function(response){
		console.log("odgovor");
		croppedimg = response;
		$('#croppieModal').removeClass("visible");
     
    })
  });