$(document).ready(function(){
    var url = document.URL;
    if(/about/.test(url.toLowerCase()))
    {
      $("#about").addClass("ui-btn-active");
    }
    else if(/services/.test(url.toLowerCase()))
    {
      $("#services").addClass("ui-btn-active");
    }
    else if(/positions/.test(url.toLowerCase()))
    {
      $("#positions").addClass("ui-btn-active");
    }
    else if(/contact/.test(url.toLowerCase()))
    {
      $("#contact").addClass("ui-btn-active");
    }
});