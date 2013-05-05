class Qwikstubs.Views.EventsIndex extends Backbone.View
  tagName: 'div'

  template: JST['events/index']

  events:
    'click #next-page': 'nextPage'
    'click #previous-page': 'previousPage'
    'click #sort-date': 'sortdate'
    'click #sort-name': 'sortname'
    # 'click': 'showEvent'

  	#'submit #new_event' : 'createEvent'

  initialize: ->
    @collection.on('reset', @render, @ )
    @collection.on('add', @appendEventToList, @ )

  render: ->
    $(@el).html(@template())
    @collection.each(@appendEventToList)
    @

  appendEventToList: (event) ->
    # @collectionV = new Qwikstubs.Collections.Venues();
    #    @collectionV.fetch({
    #    success: (@collectionV) ->
    #      @venue = @collectionV.get(event.get('venue_id'))
    #      console.log(@venue)
      view = new Qwikstubs.Views.Event(model: event)
      $('#list_event').append(view.render().el)
    # })
  	
  
  nextPage: ->
    @collection.nextPage()
  
  previousPage: ->
    @collection.previousPage()
    
  sortname: ->
    console.log("NAME:")
    console.log(@collection.sortVar)
    switch @collection.sortVar
      when "date"
        console.log("Fresh")
        @collection.sortVar = "name"
        @collection.sort()
        @render()
        $('#sort-name i').css("visibility", "visible")
        $('#sort-date i').css("visibility", "hidden")
      when "name"
        console.log("Reverse")
        @collection.models.reverse()
        @render()
        $('#sort-name i').css("visibility", "visible")
        $('#sort-date i').css("visibility", "hidden")
  
  sortdate: ->
    console.log("DATE:")
    console.log(@collection.sortVar)
    switch @collection.sortVar
      when "name"
        @collection.sortVar = "date"
        @collection.sort(@collection.models)
        @render()
        $('#sort-name i').css("visibility", "hidden")
        $('#sort-date i').css("visibility", "visible")
      when "date"
        console.log("Reverse")
        @collection.models.reverse()
        @render()
        $('#sort-name i').css("visibility", "hidden")
        $('#sort-date i').css("visibility", "visible")
    
  
  # showEvent: ->
  #         @collection.showEvent()


  #createEvent: (event) ->
  	#event.preventDefault()
  	#@collection.create
  	#	name: $('#new_venue_name').val()
  	#	city: $('#new_venue_city').val()
  	#	state: $('#new_venue_state').val()
  	#$('#new_venue')[0].reset()
  		
