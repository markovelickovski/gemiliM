var kateg = "furniture";
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
   
	$.ajax({
		type: "POST",
		url: 'php/get_items.php',
		data: {kateg:kateg},
		success: function(data)
		{
			console.log(data);
			if(data !== "nema")
			{
				FillItems(data);
			}
		},
		dataType: 'json' 
	});     

});



function FillItems(lista)
{
	$(".Showcase").empty();
	for(i=0;i< lista.length;i++)
	{
		$(".Showcase").append('<div class="col-4 '+lista[i].type+' show-list-item"><figure class="Showcase-item">'+
								'<img src="' + lista[i].image + '" alt="product item">'+
									'<figcaption class="Description">'+
										'<p>' + lista[i].name + '</p>'+
										'<a href="Itemview.html?id=' + lista[i].item_no + '" class="button button-small">Project details</a>'+
									'</figcaption>'+
								'</figure></div>');
	}
	

}