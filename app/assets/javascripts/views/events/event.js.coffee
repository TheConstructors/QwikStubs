class Qwikstubs.Views.Event extends Backbone.View

  template: JST['events/event']
  tagName: 'tr'

  render: ->
  	$(@el).html(@template(event: @model))
  	@