require 'eventmachine'
require 'debugger'
require 'em-websocket'
require 'json'

def log(msg)
  puts msg
end

count = 0

EventMachine::WebSocket.start host: "localhost", port: 8080 do |ws|
  #ws.onopen { ws.send "Hello Client!" }

  ws.onmessage do |msg|
    log msg
    if msg == 'count:get'
      response = { event: 'count:set', data: count }.to_json
      ws.send response
    elsif msg == 'count:inc'
      count += 1
      response = { event: 'count:set', data: count }.to_json
      ws.send response
    else 
      ws.send msg 
    end
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
