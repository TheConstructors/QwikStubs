window.Qwikstubs =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: -> 
   	Dashboard = new Qwikstubs.Routers.Dashboard()
    Venues = new Qwikstubs.Routers.Venues()
    Events = new Qwikstubs.Routers.Events()
    Backbone.history.start()

$(document).ready ->
  Qwikstubs.initialize()
