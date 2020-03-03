var shownitem;
var cart = [];
var loggeduser;
var logiran = false;
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
		logiran=true;
		loggeduser = tempuser;
		$(".login_mb").addClass("hidden");
		$(".llink").removeClass("hidden");
		$(".modal").removeClass("visible");
		
	}
   var id = location.search.substring(1).split("=")[1];
	$.ajax({
		type: "POST",
		url: 'php/viewitem.php',
		data: {id:id},
		success: function(data)
		{
			console.log(data);
			if(data !== "nema")
			{

				FillFields(data[0]);
			}
		},
		error: function(err)
		{
			console.log(err);
		},
		dataType: 'json'
	});     

	var temp = sessionStorage.getItem("cart");
	if(temp != "undefined" && temp != undefined && temp != "null" && temp != null)
	{
		cart = JSON.parse(temp);
	}

});

function FillFields(data)
{
	shownitem = data; 
	$("#item_name").html(data.name);
	$("#item_price").html("$"+data.price);
	$("#item_stock").html(data.stock);
	
	$("#item_img").attr("src", data.image);
	var desc = JSON.parse(data.description);
	if(data.category == "furniture")
	{
		$("#item_description").empty();
		$("#item_description").append('<div class="row desc-row desc-main-text">'+
					'<div class="col-12 text-center">'+ desc.textone +'</div>'+
				'</div>'+
				'<div class="row desc-row">'+
					'<div class="col-4 col-title text-right">Length: </div>'+
					'<div class="col-8 col-text text-left">'+ desc.length +'</div>'+
				'</div>'+
				'<div class="row desc-row">'+
					'<div class="col-4 col-title text-right">Width: </div>'+
					'<div class="col-8 col-text text-left">'+ desc.width +'</div>'+
				'</div>'+
				'<div class="row desc-row">'+
					'<div class="col-4 col-title text-right">Height: </div>'+
					'<div class="col-8 col-text text-left">'+ desc.height +'</div>'+
				'</div>'+
				'<div class="row desc-row desc-main-text">'+
					'<div class="col-12 text-center">'+ desc.texttwo +'</div>'+
				'</div>'+
				'<div class="row desc-row">'+
					'<div class="col-4 col-title text-right">Country of origin: </div>'+
					'<div class="col-8 col-text text-left">'+ desc.origin +'</div>'+
				'</div>');
	}
	else if(data.category == "chairs")
	{
		$("#item_description").empty();
		var appended = "";
		
		if(desc.text.length > 5)
		{
			appended+='<div class="row desc-row desc-main-text">'+
					'<div class="col-12  text-center">'+ desc.text +'</div>'+
				'</div>';
		}
		if(desc.mechanism.length> 3)
		{
			appended+='<div class="row desc-row">'+
					'<div class="col-4 col-title text-right">Mechanism: </div>'+
					'<div class="col-8 col-text text-left">'+ desc.mechanism +'</div>'+
				'</div>';
		}
		if(desc.base.length> 3)
		{
			appended+='<div class="row desc-row">'+
					'<div class="col-4 col-title text-right">Base: </div>'+
					'<div class="col-8 col-text text-left">'+ desc.base +'</div>'+
				'</div>';
		}
		if(desc.finish.length> 3)
		{
			appended+='<div class="row desc-row">'+
					'<div class="col-4 col-title text-right">Finish: </div>'+
					'<div class="col-8 col-text text-left">'+ desc.finish +'</div>'+
				'</div>';
		}
		if(desc.height.length> 3)
		{
			appended+='<div class="row desc-row">'+
					'<div class="col-4 col-title text-right">Height: </div>'+
					'<div class="col-8 col-text text-left">'+ desc.height +'</div>'+
				'</div>';
		}
		if(desc.seatwidth.length> 3)
		{
			appended+='<div class="row desc-row">'+
					'<div class="col-4 col-title text-right">Seat Width/Length: </div>'+
					'<div class="col-8 col-text text-left">'+ desc.seatwidth +'</div>'+
				'</div>';
		}
		if(desc.color.length> 3)
		{
			appended+='<div class="row desc-row">'+
					'<div class="col-4 col-title text-right">Colors: </div>'+
					'<div class="col-8 col-text text-left">'+ desc.color +'</div>'+
				'</div>';
		}
		if(desc.finish.origin> 3)
		{
			appended+='<div class="row desc-row">'+
					'<div class="col-4 col-title text-right">Country of origin: </div>'+
					'<div class="col-8 col-text text-left">'+ desc.origin +'</div>'+
				'</div>';
		}
		
		$("#item_description").append(appended);
	}
	
}


$("#buy_btn").click(function()
{
	if(logiran)
	{
	shownitem["quantity"] = $("#set_qty").val();
	cart.push(shownitem);
	sessionStorage.setItem("cart", JSON.stringify(cart));
	alert("Successfully added to cart!");
	}
	else
	{
		alert("You have to log in first!");
	}
});

//QUANTITY BUTTONS
$(".qtybutton").on("click", function () {
	var newVal;
	var $button = $(this);
    var oldValue = $("#set_qty").val();
    var itemstock = $("#item_stock").html();
    console.log(oldValue);
	if ($button.text() == "+") {
		if((parseFloat(oldValue) + 1) <= parseFloat(itemstock))
		{
			newVal = parseFloat(oldValue) + 1;
		}
		else
		{
			newVal = oldValue;
		}
		
	} else {
		// Don't allow decrementing below zero
		if (oldValue > 1) {
			newVal = parseFloat(oldValue) - 1;
		} else {
			newVal = 1;
		}
	}
	$("#set_qty").val(newVal);
});