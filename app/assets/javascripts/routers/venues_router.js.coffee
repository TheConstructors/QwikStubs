class Qwikstubs.Routers.Venues extends Backbone.Router
  routes:
  	'venue': 'index'
  	'venue/:id': 'show'

  index: ->
  	view = new Qwikstubs.Views.VenuesIndex(collection: @collection)
  	$('#container').html(view.render().el)

  initialize: ->
  	@collection = new Qwikstubs.Collections.Venues()
  	@collection.fetch()

  show: (id) ->
  	# @index()
  	alert "entry #{id}"