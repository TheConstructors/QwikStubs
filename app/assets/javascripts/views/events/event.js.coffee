class Qwikstubs.Views.Event extends Backbone.View
  template: JST['events/event']

  tagName: 'tr'
  #'click': '#events/@model.id'

  render: ->
  	$(@el).html(@template(event: @model))
  	@
