/* # Initial naive implementation.

# Introduces the concept of the "remote:" namespace.
# 
# An event begining with the namesapce "remote: " will skip normal event dispatch,
# and send its event across the WebSocket to the listening server.
# */

$(document).ready(function() {

  /* RemoteEvents = (@host, @port, @eventList) ->
      @wsocket = new WebSocket("ws://#{@host}:#{@port}")

      @wsocket.onopen = -> console.log("Opened")

      @wsocket.onclose = -> console.log("Closed")

      @wsocket.onerror = -> console.log("Error")

      @wsocket.onmessage = (msgEvent) ->
        console.log(msgEvent)

    isRemoteEvent: (name) ->
        regex = new RegExp("remote:.*")
        regex.test(name)
  
  RemoteEvents.prototype = _.extend({}, Backbone.Events)
  
  superTrigger = RemoteEvents::trigger

  RemoteEvents::trigger = (name) ->
      console.log("hit trigger")
      if @isRemoteEvent(name)
        console.log("matches remote")
        remoteTrigger(name.substring(7))
      else
        super prototype

  RemoteEvents::remoteTrigger = (name) ->
      console.log("Triggering remote event: #{name}")

  RemoteEvents.api = "RemoteEvents-0.0.1"
  
  window.RemoteEvents = RemoteEvents */
  var RemoteEvents = function(host, port, eventlist) {
      this.wsocket = new WebSocket("ws://" + host + ":" + port)
      this.host = host
      this.port = port
      this.wsocket.onopen = function() {};
      this.wsocket.onclose = function() {};
      this.wsocket.onerror = function() {};
      this.wsocket.onmessage = function() {};
      return this;
  };

  RemoteEvents.prototype = _.extend({}, Backbone.Events)

  var oldTrigger = RemoteEvents.prototype.trigger;
  
  var isRemoteName = function(name) {
      var regex = /remote:.*/;
      return regex.test(name);
  }

  RemoteEvents.prototype.trigger = function(name) {
      if (isRemoteName(name)) {
          this.remoteTrigger(name.substring(7));
      } else {
          oldTrigger(name);
      }
  };

  RemoteEvents.prototype.remoteTrigger = function(name) {
      console.log("Triggering remote event: " + name);
  };

  window.RE = RemoteEvents;
});

