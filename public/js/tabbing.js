$(document).ready(function(){
  $('[id^=label]').click(function(){
    var idno = "#content" + $(this).attr('id').slice(5);
    $("[id^='content']").hide();
    $(idno).fadeIn();
  });
});