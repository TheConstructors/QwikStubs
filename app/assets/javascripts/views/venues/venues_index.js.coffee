class Qwikstubs.Views.VenuesIndex extends Backbone.View

  template: JST['venues/index']

  events:
  	'submit #new_venue' : 'createVenue'

  initialize: ->
  	@collection.on('reset' , @render, @ )
  	@collection.on('add' , @appendVenueToList, @ )

  render: ->
  	$(@el).html(@template())
  	@collection.each(@appendVenueToList)
  	@

  appendVenueToList: (venue) ->
  	view = new Qwikstubs.Views.Venue(model: venue)
  	$('#list_venue').append(view.render().el)

  createVenue: (venue) ->
  	venue.preventDefault()
  	@collection.create
  		name: $('#new_venue_name').val()
  		city: $('#new_venue_city').val()
  		state: $('#new_venue_state').val()
  	$('#new_venue')[0].reset()
  		