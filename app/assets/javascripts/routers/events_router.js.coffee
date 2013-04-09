class Qwikstubs.Routers.Events extends Backbone.Router
	routes:
	    'event': 'index'
	    'events/:id': 'show'

	  index: ->
		  view = new Qwikstubs.Views.EventsIndex()
		  $('#container').html(view.render().el)
		
		show: (id) ->
			  alert "Event #{id}"