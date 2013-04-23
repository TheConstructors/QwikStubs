class Qwikstubs.Routers.Dashboard extends Backbone.Router
  routes:
  	'': 'index'

  initialize: ->
  	@collection = new Qwikstubs.Collections.Events()
  	@collection.fetch()

  index: ->
  	@collection = new Qwikstubs.Collections.Venues()
  	@collection.fetch()
  	view = new Qwikstubs.Views.DashboardIndex(collection: @collection)
  	$('#container').html(view.render().el)
