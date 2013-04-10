class Qwikstubs.Views.EventsIndex extends Backbone.View

	template: JST['events/index']

  events:
  	'submit #new_event' : 'createEvent'

  initialize: ->
  	@collection.on('reset' , @render, @ )
  	@collection.on('add' , @appendEventToList, @ )

  render: ->
  	$(@el).html(@template())
  	@collection.each(@appendVenueToList)
  	@

  appendVenueToList: (venue) ->
  	view = new Qwikstubs.Views.Venue(model: venue)
  	$('#list_venue').append(view.render().el)

  createVenue: (event) ->
    #needs rework for event
  	event.preventDefault()
  	@collection.create
  		name: $('#new_event_name').val()
  		city: $('#new_event_city').val()
  		state: $('#new_event_state').val()
  	$('#new_venue')[0].reset()
  		
