window.Qwikstubs =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new Qwikstubs.Routers.Venues
    Backbone.history.start()

$(document).ready ->
  Qwikstubs.initialize()
