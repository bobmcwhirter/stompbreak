
if (!window.Stompbreak) {
  window.Stompbreak = {};
}

Stompbreak.client = Stomp.client( 'ws://localhost:8675' );
Stompbreak.connect = function() {

  var messagePrinter = function(div_id, message) {
    $( div_id + ' .content' ).append( message.body + "\n" );
  };  

  $(window).unload( function() { 
    Stompbreak.client.disconnect() 
  } );

  Stompbreak.client.connect( null, null, function() {

    Stompbreak.client.subscribe( '/heartbeat', function(message) {
      messagePrinter( "#heartbeat", message );
    } );

  } );
  
};

Stompbreak.connect();
