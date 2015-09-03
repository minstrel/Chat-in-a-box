require 'cgi'

class MessageController < WebsocketRails::BaseController
  def out_message
    # Debugging
    # puts "Message received from form submit:"
    # puts CGI::escapeHTML(message[:from]) + " " + CGI::escapeHTML(message[:text])
    # Sanitize before returning to connected clients
    # I don't know if this adds much security, but it prevents the users from i
    # nserting an accidental < and posting a blank message
    message[:from] = CGI::escapeHTML(message[:from])
    message[:text] = CGI::escapeHTML(message[:text])
    broadcast_message :out_message, message
  end
end
