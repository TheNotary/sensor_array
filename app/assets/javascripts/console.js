// This is code for the console thing



// create a faye client

// subscribe to the messaging channel

// in lcd.js, we will add an extension to handle what message types to grab and put into the console

fayeUtility = { client: ""};
fayeUtility.createNewFayeClient = function(serverAddress, chatPort){
  var client = new Faye.Client('http://' + serverAddress + ':' + chatPort.toString() + '/faye', {
    timeout: 120
  });
  client.bind('transport:down', function() {
    alert('Warning:  The connection has been lost.');
    // fayeUtility.setStatusToFailed();
  });
  client.bind('transport:up', function() {
    // printToConsole("Connected to Faye");
    //fayeUtility.setStatusToConnected();
  });
  
  // self.client = client;
  return client;
}



function print(msg){
	$(".console .line").html(msg);
}

function setupFayeForConsole(){
  var port = location.port;
  var channel = "console";
  var client = fayeUtility.createNewFayeClient("localhost", port);

  client.subscribe('/' + channel, function(message) {
    print(message.text);
  });
}

// Uncomment below to use faye
// setupFayeForConsole();


