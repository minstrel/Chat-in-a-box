// Connect to the websocket server
var post_socket = new WebSocketRails(window.location.host + '/websocket');
// console.log("up and running!!!");

// Send a message to the socket when the form is submitted
// Have to use ready page: load due to turbolinks, maybe...
// $(document).ready(function(){
$(document).on('ready page:load', function (){
  // Bind new_message event to update the talk area 
  post_socket.bind('out_message', function (contents) {

    // Pull the new post down and append it to the chat area.
    // Uses :layout => false in the controller to get just the html
    $.get("/posts/" + contents.postid, function(data) {
      $("#chat_area").prepend(data);
    });
  });
})

