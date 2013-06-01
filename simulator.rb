require 'faraday'
require 'json'
require 'debugger'

def get_some_seats
  result = Faraday.post 'http://localhost:3000/api/orders?event_id=51a926fedaba7819880005a1'
  order = JSON.parse(result.body)
  id = order["id"]
  debugger
  ticket_request = "http://localhost:3000/api/orders/#{id}.json?type=best&num=1"
  Faraday.put ticket_request
end

(0..100).each do |i|
  get_some_seats
end
