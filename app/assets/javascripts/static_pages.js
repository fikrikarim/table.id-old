$(document).ready(function() {
  $('.vote-link-up').click(function(e){
    $(this).toggleClass('upvote-clicked');
    $(this).off("click").attr('href', "javascript: void(0);");
  });
});
