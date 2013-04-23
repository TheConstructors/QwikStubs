class Qwikstubs.Views.DashboardIndex extends Backbone.View

  template: JST['dashboard/index']

  initialize: ->
  	#@collection.on('reset' , @render, @ )
  	
    #@collection.on('add' , @appendEventToList, @ )

  render: ->
  	$(@el).html(@template())
  	#@collection.each(@appendEventToList)
  	@

  appendEventToList: (event) ->
  	view = new Qwikstubs.Views.Event(model: event)
  	$('#list_event').append(view.render().el)


  		