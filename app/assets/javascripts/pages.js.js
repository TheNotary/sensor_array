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


// Resolves an array consisting of [Header, depth] pairs
// alertModal(makeTocHtml())
function makeTocHtml(){
	var tree = makeTOCNodes();
	var html = convertTextTreeToHTML(tree);
	return html;
}

// I want output like...
// tree = { "Main Header": ["child header 1", "child header 2", {"child header 3": ["lil baby header"]}] }
function makeTOCNodes(){
	var allHeaders = $( ":header" ).toArray();
	
	var depth = 0;
	var lastTag = "";
	var tree = [];
	$.each(allHeaders, function( index, el ) {
		if (index == 0) return "continue";
		
		depth = determineDepth(lastTag, el.tagName, depth);
		tree.push([el.innerHTML, depth]);
		
		lastTag = el.tagName;
	});
	
	return tree;
}


function determineDepth(lastTag, currentTag, currentDepth){
	if (lastTag == "") return 0;
	
	// strip 'H' from say 'H1'
	lastTag = parseInt(lastTag.substring(1));
	currentTag = parseInt(currentTag.substring(1));
	
	if (lastTag < currentTag) return currentDepth + 1;
	if (lastTag == currentTag) return currentDepth;
	if (lastTag > currentTag) return currentDepth - 1;
}

// convertTextTreeToHTML([ "Main Header", "-Child of main", "--child of child", "New Main Header"])
function convertTextTreeToHTML(tree){
	var lastDepth = 0;
	var outputHTML = "<ul>";
	$.each(tree, function( index, value ){
		var header = value[0];
		var currentDepth = value[1];
		
		outputHTML += beginOrEndSubList(lastDepth, currentDepth);
		lastDepth = currentDepth;
		
		var depth = value[1];
		outputHTML = outputHTML + "<li>" + header + "</li>";
	});
	
	for (var i = 0; i <= lastDepth; i++)
		outputHTML += "</ul>";
	
	return outputHTML;
}

// Adds a new <ul> if we're dropping to another level.  
function beginOrEndSubList(lastDepth, currentDepth){
	if (lastDepth < currentDepth)
		return "<ul>";
	else if (lastDepth > currentDepth)
		return "</ul>";
	else
		return "";
}

function placeTocOnPage(){
	if ( $( ":header" ).toArray().length <= 2  ){
		$("#toc").hide();
		return;
	} 
	$("#toc").html(makeTocHtml());
}


