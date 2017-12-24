//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require_tree .

$(".sidebar-toggle").click(function(e) {
  e.preventDefault();
  $("#wrapper").toggleClass("toggled");
});

$(document).ready(function(){
  var changeWidth = function(){
    if ( $(window).width() < 576 ){
    $('#wrapper').removeClass('toggled');
    } else {
      $('#wrapper').addClass('toggled');
    }
  };

  $(window).resize(changeWidth);
  changeWidth();
});