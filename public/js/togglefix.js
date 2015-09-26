$(document).ready(function(){
  $(document).on('scroll', function(){
    $('#tobstick').toggleClass('left_fixed_div',$(document).scrollTop()>=271);
  });
});