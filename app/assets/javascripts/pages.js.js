function btnShutdown(){
  $.get('/cmds/shutdown', function(data){ 
    $('body').append("Successfully got the page.");
	});
}


function btnSnapPhoto(){
  // Do ajax req to tell raspberry to take a picture and put it in public/snap.jpeg
  var jqxhr = $.get( "/api/snap_photo", function( data ) {
  	  // Refresh the jpeg
      $("#camera").attr('src', '');
      $("#camera").attr('src', '/tmp/snap.jpg');
      //alert( "Load was performed." + data );
      print("snapped photo!");
    })
     .fail(function() {
       print("something went wrong snapping photo!");
     });

  print("snapping photo, this may take a few seconds...");

  
}

function print(msg){
	$(".console .line").html(msg);
}
