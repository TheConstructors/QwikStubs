window.Qwikstubs =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: -> 
    Venues = new Qwikstubs.Routers.Venues()
    Events = new Qwikstubs.Routers.Events()
    Backbone.history.start()
$(document).ready ->
  Qwikstubs.initialize()
