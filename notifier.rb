require 'eventmachine'
require 'debugger'
require 'em-websocket'

EventMachine::WebSocket.start host: "localhost", port: 8080 do |ws|
  ws.onopen { ws.send "Hello Client!" }

  ws.onmessage do |msg|
    #debugger
    puts msg
    ws.send "Dummy" 
  end

  ws.onerror { |e| puts e }
  ws.onclose { puts "WebSocket closed" }
end


class EventParser
  def self.parse(raw_event)
    # let's just return a ruby hash/array for now
    JSON::parse(raw_event)
  end
end
