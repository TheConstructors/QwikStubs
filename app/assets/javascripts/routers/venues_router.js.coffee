class Qwikstubs.Routers.Venues extends Backbone.Router
  routes:
  	'venue': 'index'
  	'venue/:id': 'show'

  index: ->
  	view = new Qwikstubs.Views.VenuesIndex()
  	$('#container').html(view.render().el)
  show: (id) ->
  	alert "entry #{id}"