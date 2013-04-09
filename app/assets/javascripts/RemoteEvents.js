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

    /* place holder for log abstract */
    var log = function(msg) {
        console.log(msg);
    }
    var host = "localhost",
        port = '8080';
    
    var EventProxy = new WebSocket("ws://" + host + ":" + port)

    EventProxy.onopen = function() {
        log("Opened connection to " + host + ":" + port);
    }

    EventProxy.onclose = function() {
        log("Closed connection.");
    }

    EventProxy.onerror = function(error) {
    
    }

    EventProxy.onmessage = function(e) {
        log("Received event: " + e.data);
    }
    
    /* this can be made more efficent by causing the special binding to
     * happen once at load time */
    EventProxy.sendEvent = function (receiver, msg) {
        EventProxy.onmessage = function(e) {
            log("Received event: " + e.data);
            var response = JSON.parse(e.data);
            var ev = response["event"];
            var data = response["data"];
            /* custom trigger code here, optimize like Backbone */
            /* currently only invoke one */
            var callback = receiver._events[ev][0].callback;
            log(callback);
            callback(ev, data);
        }

        EventProxy.send(msg);
    }

    var RemoteEvents = _.extend({}, Backbone.Events)

    /* One needs to be careful treating a method like a function
     * in JavaScript. Make sure to invoke this with defaultTrigger.call
     * the method needs a 'this' parameter passed explicitly */
    var defaultTrigger = Backbone.Events.trigger 
    var defaultOn = Backbone.Events.on

    var isRemote = function(name) {
        var regex = /remote:.*/;
        return regex.test(name);
    }

    RemoteEvents.trigger = function(name) {
        if (isRemote(name)) {
            this.triggerRemote(name.substring(7));
        } else {
            defaultTrigger.call(this, name);
        }
    };

    /* RemoteEvents.on = function(name, callback) {
        if (isRemote(name)) {
            this.onRemote(name.substring(7));
        } else {
            defaultOn.call(this, name);
        }
    }
    
    /* Have a remote event be able to return data */
    RemoteEvents.onRemote = function(name, callback) {
       defaultOn.call(this, name); 
    }

    RemoteEvents.triggerRemote = function(name) {
        console.log("Proxying to ...");
        console.log(this);
        EventProxy.sendEvent(this, name);
    };

    Backbone.Events = RemoteEvents;
});

