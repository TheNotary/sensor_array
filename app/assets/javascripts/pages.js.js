function btnShutdown(){
  $.get('/cmds/shutdown', function(data){ 
    $('body').append("Successfully got the page.");
	});
}


function btnSnapPhoto(){
  // Do ajax req to tell raspberry to take a picture and put it in public/snap.jpeg
  var jqxhr = $.get( "/api/snap_photo", function( data ) {
      alert( "Load was performed." + data );
    })
     .fail(function() {
       alert( "error" );
     });


  // wait for ajax response to return true

  // Refresh the jpeg
  $("#camera").attr('src', '');
  $("#camera").attr('src', '/tmp/snap.jpg');
}
