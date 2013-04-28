class Qwikstubs.Views.DashboardEventMiniProfile extends Backbone.View
  template: JST['dashboard/dashboard_event_mini_profile']

  tagName: 'div'

  render: ->
  	$(@el).html(@template(event: @model))
  	@
