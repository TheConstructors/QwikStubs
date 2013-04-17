class Qwikstubs.Routers.Venues extends Backbone.Router
  routes:
  	'venues': 'index'
  	'venues/:id': 'show'

  initialize: ->
  	@collection = new Qwikstubs.Collections.Venues()
  	@collection.fetch()

  index: ->
  	@collection = new Qwikstubs.Collections.Venues()
  	@collection.fetch()
  	view = new Qwikstubs.Views.VenuesIndex(collection: @collection)
  	$('#container').html(view.render().el)

  show: (id) ->
  	# @index()
  	alert "entry #{id}"