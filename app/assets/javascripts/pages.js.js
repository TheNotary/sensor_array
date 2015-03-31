function btnShutdown(){
  $.get('/cmds/shutdown', function(data){ 
    $('body').append("Successfully got the page.");
	});
}


function btnSnapPhoto(){
	
  print("snapping photo, this may take a few seconds...");
  
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

}

function print(msg){
	$(".console .line").html(msg);
}


function printToLcd(msg){
	var uri = "/api/print_to_lcd";
	var arguments = { msg: "hi all"};  // too lazy to implement
	var attempting_msg = "Printing to LCD...";
	var complete_msg = "Printed to LCD";
	var fail_msg = "something went wrong printing to LCD";
	
	print(attempting_msg);
	
	// Do ajax req to tell raspberry to take a picture and put it in public/snap.jpeg
	var jqxhr = $.get( uri + "?msg=" + msg, function( data ) {
  		// Refresh the jpeg
		print(complete_msg);
	})
	.fail(function() {
		print(fail_msg);
	});

}

var ajaxConfigObject = {};   // too lazy to implement, but really, really should so it's in my library





// a replacement for browser alerts
function alertModal(msg, title){
	if (typeof title == 'undefined') title = "Information";
	$('#alertModalTitle').html(title);
	$('#alertModalBody').html(msg);
	$('#alertModal').modal('show');
}


