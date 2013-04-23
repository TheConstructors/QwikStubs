class Qwikstubs.Views.EventsShow extends Backbone.View

  template: JST['events/show']

  #events:
  	#'submit #new_event' : 'createEvent'

  #initialize: ->
  	#this.event.on('reset' , @render, @ )
  	#this.event.on('add' , @appendEventToList, @ )

  render: ->
    $(@el).html(@template(event: model, venue: model2))
    @

  #appendEventToList: (event) ->
    #view = new Qwikstubs.Views.Event(model: event)
    #$('#list_event').append(view.render().el)

  #createEvent: (event) ->
  	#event.preventDefault()
  	#@collection.create
  	#	name: $('#new_venue_name').val()
  	#	city: $('#new_venue_city').val()
  	#	state: $('#new_venue_state').val()
  	#$('#new_venue')[0].reset()
  		