require 'faraday'
require 'json'
require 'debugger'

HOSTNAME = "localhost:8080" 

event_id = ARGV[0]

def build_request(event_id)
  result = Faraday.post "http://#{HOSTNAME}/api/orders?event_id=#{event_id}"
  order = JSON.parse(result.body)
  id = order["id"]
  ticket_request = "http://#{HOSTNAME}/api/orders/#{id}.json?type=best&num="
  Proc.new { |i| Faraday.put (ticket_request + i.to_s) }
end

request = build_request(event_id)

threads = (1..8).map do |number|
  Thread.start do
    (0..107).each do |i|
      request.call(number)
      sleep(1)
    end
  end
end

threads.each do |th|
  th.join
end
