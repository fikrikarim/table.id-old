$(document).on('turbolinks:load', function() {
  $('.vote-link-up').click(function(e){
    $(this).addClass('upvote-clicked');
    // Increase the vote score.
    // var id = this.id.match(/\d+/);
    // $('span#id').toggleClass('upvote-clicked');
  });
  $('.vote-link-down').click(function(e){
    $(this).addClass('downvote-clicked');
    // Increase the vote score.
    // var id = this.id.match(/\d+/);
    // $('span#id').toggleClass('upvote-clicked');
  });
});
