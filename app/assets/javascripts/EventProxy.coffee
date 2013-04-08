# Initial naive implementation.

class EventReceiver
  constructor: (@host, @port, @eventList) ->
    @wsocket = new WebSocket("ws://#{@host}:#{@port}")

    @wsocket.onopen = -> console.log("Opened")
    
    @wsocket.onclose = -> console.log("Closed")

    @wsocket.onerror = -> console.log("Error")

    @wsocket.onmessage = (msgEvent) ->
      console.log(msgEvent)
  
  sendEvent = (e) ->
    console.log("Sending: #{e}")
 
er = new EventReceiver("localhost", "8080")
