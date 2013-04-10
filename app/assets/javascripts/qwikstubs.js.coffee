window.Qwikstubs =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: -> 
    Events = new Qwikstubs.Routers.Events()
    Venues = new Qwikstubs.Routers.Venues()
    Backbone.history.start()
$(document).ready ->
  Qwikstubs.initialize()
