window.Qwikstubs =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new Qwikstubs.Routers.Events
    Backbone.history.start()
$(document).ready ->
  Qwikstubs.initialize()
