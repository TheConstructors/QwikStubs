class Qwikstubs.Views.EventsIndex extends Backbone.View

	template: JST['events/index']

  events:
  	'submit #new_event' : 'createEvent'

  initialize: ->
  	$('.container').html("<p>hey</p>")
  	#@collection.on('reset' , @render, @ )
  	#@collection.on('add' , @appendEventToList, @ )

  render: ->
  	#$(@el).html("<p>hey</p>")
  	#@collection.each(@appendEventToList)
    @

  hey: ->
    alert "hey"

  appendEventToList: (event) ->
  	view = new Qwikstubs.Views.Event(model: event)
  	$('#list_event').append(view.render().el)

  appendVenueToSelect: (venue) ->
  	view = new Qwikstubs.Views.Event(model: venue)
  	$('#list_event').append(view.render().el)

  createEvent: (event) ->
    #needs rework for event
    event.preventDefault()
    @collection.create
      name: $('#new_event_name').val()
      date: $('#new_event_date').val()
      time: $('#new_event_time').val()
      #venue: $('#new_event_venue').val()
      #promoter: $('#new_event_promoter').val()
    $('#new_venue')[0].reset()
  		
