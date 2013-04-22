class Qwikstubs.Views.EventsIndex extends Backbone.View

  template: JST['events/index']

  #events:
  	#'submit #new_event' : 'createEvent'

  initialize: ->
  	@collection.on('reset' , @render, @ )
  	@collection.on('add' , @appendEventToList, @ )

  render: ->
  	$(@el).html(@template())
  	@collection.each(@appendEventToList)
  	@

  appendEventToList: (event) ->
  	view = new Qwikstubs.Views.Event(model: event)
  	$('#list_event').append(view.render().el)

  #createEvent: (event) ->
  	#event.preventDefault()
  	#@collection.create
  	#	name: $('#new_venue_name').val()
  	#	city: $('#new_venue_city').val()
  	#	state: $('#new_venue_state').val()
  	#$('#new_venue')[0].reset()
  		