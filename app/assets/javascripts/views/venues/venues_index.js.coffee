class Qwikstubs.Views.VenuesIndex extends Backbone.View

  template: JST['venues/index']

  render: ->
  	$(@el).html(@template(venues: "Venues here"))
  	@
