var cart;
var user;
var wtot = 0;
var chistory = [];

$( document ).ready(function() {

	var h = $(".profile_history").height() + 96;
	console.log("height: "+h);
	$(".profile_info").height(h);

	var tempuser = JSON.parse(sessionStorage.getItem("loggeduser"));
if(tempuser !== "undefined" && tempuser !== undefined && tempuser !== null && tempuser !== "null")
{ 
	user = tempuser;
	console.log(user);
	$(".login_mb").addClass("hidden");
	$(".llink").removeClass("hidden");
	$(".modal").removeClass("visible");
	$.ajax({
		type: "POST",
		url: 'php/getuser.php',
		data: {userid:user.account_no},
		success: function(data)
		{
			console.log(data);
			if(data !== "nema")
			{
				$(".profile_pic").css('background-image','url("'+data[0].image+'")');
				$("#user_full_name").html(data[0].name + " " + data[0].lastname);
				$("#user_username").html(data[0].username);
				$("#user_email").html(data[0].email);
				
				if(data[0].history.length > 10)
				{
					chistory = JSON.parse(data[0].history);
					
					FillHistory(chistory);
				}
				else chistory = [];
				
				
			}
			else
			{
				
			}
		},

		dataType: 'json' 
	});     
}
else
{user = "nema";}
var tempcart = JSON.parse(sessionStorage.getItem("cart"));
if(tempcart !== "undefined" && tempcart !== undefined && tempcart !== null && tempcart !== "null")
{ cart = tempcart;}
else {cart = [];}

	$("#user_cart").empty();
	$("#user_cart").append('<div class="cart_title">'+
									'<div class="cirow">'+
										'<div class="cicol col-3 ciname">Name</div>'+
										'<div class="cicol col-1 ciprice">Price</div>'+
										'<div class="cicol col-1 ciquantity">Quantity</div>'+
										'<div class="cicol col-1 citotal">Total</div>'+
									'</div>'+
								'</div>');

	$("#user_history").empty();
	$("#user_history").append('<div class="cart_title">'+
									'<div class="cirow">'+
										'<div class="cicol col-3 ciname">Name</div>'+
										'<div class="cicol col-1 ciprice">Price</div>'+
										'<div class="cicol col-1 ciquantity">Quantity</div>'+
										'<div class="cicol col-1 citotal">Total</div>'+
									'</div>'+
								'</div>');
	if(cart.length > 0)
	{
	
	for(i=0;i<cart.length;i++)
	{
		var total = parseFloat(cart[i].price)*parseFloat(cart[i].quantity);
		wtot+= total;
		$("#user_cart").append('<div class="cart_item">'+
									'<div class="cirow">'+
										'<div class="cicol col-3 ciname">' + cart[i].name + '</div>'+
										'<div class="cicol col-1 ciprice">' + cart[i].price + '</div>'+
										'<div class="cicol col-1 ciquantity">' + cart[i].quantity + '</div>'+
										'<div class="cicol col-1 citotal">' + total + '</div>'+
									'</div>'+
								'</div>');
	}
	$("#wtot").html("Total: $"+ wtot);
	}
});


$(".clear_btn").click(function()
{
	ClearCart();
	

});

function ClearCart()
{
	console.log("tuka e");
	cart=[];
	sessionStorage.removeItem("cart");
	$("#user_cart").empty();
	$("#user_cart").append('<div class="cart_title">'+
									'<div class="cirow">'+
										'<div class="cicol col-3 ciname">Name</div>'+
										'<div class="cicol col-1 ciprice">Price</div>'+
										'<div class="cicol col-1 ciquantity">Quantity</div>'+
										'<div class="cicol col-1 citotal">Total</div>'+
									'</div>'+
								'</div>');
	$("#wtot").html("Total: $0");
}


function FillHistory(data)
{
	var hwtot= 0;

	
	for(k=0;k<data.length;k++)
	{
		var total = parseFloat(data[k].price)*parseFloat(data[k].quantity);
		hwtot+= total;
		$("#user_history").append('<div class="cart_item">'+
									'<div class="cirow">'+
										'<div class="cicol col-3 ciname">' + data[k].name + '</div>'+
										'<div class="cicol col-1 ciprice">' + data[k].price + '</div>'+
										'<div class="cicol col-1 ciquantity">' + data[k].quantity + '</div>'+
										'<div class="cicol col-1 citotal">' + total + '</div>'+
									'</div>'+
								'</div>');
	}
	$("#hwtot").html("Total spent: $"+ hwtot);
}

$(".buy_btn").click(function()
{
	var tempconcat = chistory.concat(cart);

	$.ajax({
		type: "POST",
		url: 'php/buy.php',
		data: {userid:user.account_no, newhist:JSON.stringify(tempconcat)},
		success: function(data)
		{
			console.log(data);
			if(data == "uspesno")
			{
				ClearCart();
				alert("Since this is a showcase and there are no actual banks behind this,there is no redirect to payment and we are assuming you paid and move the cart to history.");
			}
			else if(data == "neuspesno")
			{
				alert("Oops! Something went wrong. Please try again.");
			}
		},
		error: function(err)
		{
			//console.log(err);
		},
		dataType: 'json' 
	});        
	

});