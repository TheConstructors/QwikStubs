window.Qwikstubs =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
  	new Qwikstubs.Routers.Venues
  	Backbone.history.start(pushState: true)

$(document).ready ->
  Qwikstubs.initialize()
