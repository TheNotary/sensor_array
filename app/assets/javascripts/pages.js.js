function btnShutdown(){
  $.get('/cmds/shutdown', function(data){ 
    $('body').append("Successfully got the page.");
	});
}
