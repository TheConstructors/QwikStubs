window.Qwikstubs =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}

  initialize: ->
    @Dashboard = new Qwikstubs.Routers.Dashboard()
    @Venues = new Qwikstubs.Routers.Venues()
    @Events = new Qwikstubs.Routers.Events()
    @Pusher = new Pusher('733adbf86cbebd0e4c63')
    Backbone.history.start()

$(document).ready ->
  Qwikstubs.initialize()
