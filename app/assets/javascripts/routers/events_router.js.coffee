class Qwikstubs.Routers.Events extends Backbone.Router
	routes:
	    'event': 'index'
	    'events/:id': 'show'

	  index: ->
		  view = new Qwikstubs.Views.EventsIndex(collection: @collection)
		  $('#container').html(view.render().el)
			
		initialize: ->
		  	@collection = new Qwikstubs.Collections.Events()
		  	@collection.fetch()
		
		show: (id) ->
			  alert "Event #{id}"