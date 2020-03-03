$(window).scroll(function() {
  parallax();
})

function parallax() {

  var wScroll = $(window).scrollTop()

  $('.parallax--home-effect').css('background-position', 'center ' + (wScroll*0.85)+'px');
  $('.parallax--about-effect').css('background-position', 'center ' + (wScroll*0.85)+'px');
  $('.parallax--aboutbox').css('top', 0 + (wScroll*.010)+'em')

}
