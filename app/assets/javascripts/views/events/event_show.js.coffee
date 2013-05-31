class Qwikstubs.Views.EventsShow extends Backbone.View

  template: JST['events/show']

  events:
  	'click .purchase' : 'purchase'

  #initialize: ->
  	#this.event.on('reset' , @render, @ )
  	#this.event.on('add' , @appendEventToList, @ )

  render: ->
    $(@el).html(@template(event: @options.event, venue: @options.venue))
    @

  purchase: ->
    orders = new Qwikstubs.Collections.Orders()
    order = orders.create([],[event_id:@options.event.id,wait:true])
    console.log(order)
    view = new Qwikstubs.Views.EventPurchase(order:order)
    $('#buy').html(view.render().el)


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
  		