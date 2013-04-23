class Qwikstubs.Views.Venue extends Backbone.View

  template: JST['venues/venue']
  tagName: 'tr'

  render: ->
  	$(@el).html(@template(venue: @model))
  	@