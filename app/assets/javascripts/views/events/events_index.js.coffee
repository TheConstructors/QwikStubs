class Qwikstubs.Views.EventsIndex extends Backbone.View

	template: JST['events/index']
	
	render: ->
	          $(@el).html(@template())
	          this