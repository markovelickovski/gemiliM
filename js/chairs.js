var kateg = "chairs";
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
			else
			{
				console.log("error");
			}
		},
		error: function(err)
		{console.log(err)},
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
										'<a href="Itemview.html?id=' + lista[i].item_no + '" class="viewlink button button-small">Project details</a>'+
									'</figcaption>'+
								'</figure></div>');
	}
	

}


var nav = $('.categories');
var line = $('.line');

var active = nav.find('.active');
var pos = 0;
var wid = 0;

if(active.length) {
  pos = active.position().left;
  wid = active.innerWidth();
  line.css({
    left: pos,
    width: wid
  });
}

nav.find('ul li a').click(function(e) {
  e.preventDefault();
  if(!$(this).parent().hasClass('active') && !nav.hasClass('animate')) {
    
    nav.addClass('animate');

    var _this = $(this);

    nav.find('ul li').removeClass('active');

    var position = _this.parent().position();
    var width = _this.parent().innerWidth();

    if(position.left >= pos) {
      line.animate({
        width: ((position.left - pos) + width)
      }, 300, function() {
        line.animate({
          width: width,
          left: position.left
        }, 150, function() {
          nav.removeClass('animate');
        });
        _this.parent().addClass('active');
      });
    } else {
      line.animate({
        left: position.left,
        width: ((pos - position.left) + wid)
      }, 300, function() {
        line.animate({
          width: width
        }, 150, function() {
          nav.removeClass('animate');
        });
        _this.parent().addClass('active');
      });
    }

    pos = position.left;
    wid = width;
  }

if(_this[0].id == "all")
{
	$(".show-list-item").removeClass("hidden");
}
else if(_this[0].id == "exec")
{
	$(".operative").addClass("hidden");
	$(".waiting").addClass("hidden");
	$(".executive").removeClass("hidden");
}
else if(_this[0].id == "oper")
{
	$(".waiting").addClass("hidden");
	$(".executive").addClass("hidden");
	$(".operative").removeClass("hidden");
}
else if(_this[0].id == "wait")
{
	$(".operative").addClass("hidden");
	$(".executive").addClass("hidden");
	$(".waiting").removeClass("hidden");
}


});


