require 'faraday'
require 'json'
require 'debugger'

HOSTNAME = "localhost:8080" 

event_id = ARGV[0]

def buy_tickets(event_id, number)
  result = Faraday.post "http://#{HOSTNAME}/api/orders?event_id=#{event_id}"
  order = JSON.parse(result.body)
  id = order["id"]
  ticket_reserve = "http://#{HOSTNAME}/api/orders/#{id}.json?type=best&num="
  ticket_purchase = "http://#{HOSTNAME}/api/orders/#{id}/purchase.json?email_address=qwikstubs@gmail.com" 
  Faraday.put (ticket_reserve + number.to_s)
  sleep(5)
  Faraday.post ticket_purchase 
end

threads = (1..4).map do |number|
  Thread.start do
    (0..(50/number)).each do |i|
      buy_tickets(event_id, number)
      sleep(2)
    end

    sleep(10)

    (0..(57/number)).each do |i|
      buy_tickets(event_id, number)
      sleep(2)
    end
  end
end

threads.each do |th|
  th.join
end
