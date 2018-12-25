$(document).ready(function() {
  //var $cat_media = $('#cat_media');
  //var categories = [ '#cat_media', '#cat_social', '#cat_games', '#cat_reddit', '#cat_code', '#cat_work', '#cat_banking', '#cat_misc' ];
  
  //window.alert( categories[2] );
  window.alert( 'Hello World!' );

  //get items from local storage
  if(localStorage.getItem('vk-links')){
   $ul.html(localStorage.getItem('vk-links'));
  }
  
  // add nwe item
  /*$('#add').click(function () {

    //add new item
    $('#favorite-links').append('<li><a href="'+$url.val()+'">'+$title.val()+'</a><button class="removebtn">x</button></li>');

    //save changes to localstorage
    localStorage.setItem('vk-links', $ul.html());

    //reset form
    $title.val("");
    $url.val("http://");
    $("#add-link-form").slideToggle("100");
    
  });*/
  
  //remove item
  /*$("#favorite-links").on('click','.removebtn',function() {
    $(this).parent().remove();
    //save changes to localstorage
    localStorage.setItem('vk-links', $ul.html());
  });*/

  //form toggle
  /*$("#new-link-button").click(function() {
    $("#add-link-form").slideToggle("100");
  });*/
  
});
