require 'faraday'
require 'json'
require 'debugger'

def build_request(event_id)
  result = Faraday.post "http://localhost:3000/api/orders?event_id=#{event_id}"
  order = JSON.parse(result.body)
  id = order["id"]
  ticket_request = "http://localhost:3000/api/orders/#{id}.json?type=best&num="
  Proc.new { |i| Faraday.put (ticket_request + i.to_s) }
end

request = build_request('51a956b3c4cf0040bf0005a1')

(0..100).each do |i|
  request.call(8)
  sleep(1)
end
