$(document).ready(function() {
  $('.vote-icon-up').click(function(){
    console.log('test')
    $(this).toggleClass('upvote-clicked');
  });
});
