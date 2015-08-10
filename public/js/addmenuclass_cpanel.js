$(document).ready(function(){

    var url = document.URL;//取得当前页的URL
    if(/about/.test(url.toLowerCase()))
    {
      $("#about").addClass("active");
    }
    else if(/services/.test(url.toLowerCase()))
    {
      $("#services").addClass("active");
    }
    else if(/activities/.test(url.toLowerCase()))
    {
      $("#activities").addClass("active");
    }
    else if(/positions/.test(url.toLowerCase()))
    {
      $("#positions").addClass("active");
    }
    else if(/news/.test(url.toLowerCase()))
    {
      $("#news").addClass("active");
    }
    else if(/contact/.test(url.toLowerCase()))
    {
      $("#contact").addClass("active");
    }
    else if(/slides/.test(url.toLowerCase()))
    {
      $("#slides").addClass("active");
    }
    else if(/pictures/.test(url.toLowerCase()))
    {
      $("#pictures").addClass("active");
    }
    else if(/configs/.test(url.toLowerCase()))
    {
      $("#configs").addClass("active");
    }
    else if(/glossary/.test(url.toLowerCase()))
    {
      $("#glossary").addClass("active");
    }
    else if(/partners/.test(url.toLowerCase()))
    {
      $("#partners").addClass("active");
    }
    else
    {
      $("#cpanelhome").addClass("active");
    }
});