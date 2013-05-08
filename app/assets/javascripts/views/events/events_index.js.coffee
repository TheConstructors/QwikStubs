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
    #@collection.on('change', @render, @ )

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
    @collection.sortVar = "name"
    @collection.sort()
    @render()
    $('#sort-date i').css("visibility", "hidden")
    $('#sort-name i').css("visibility", "visible")
  
  sortdate: ->
    @collection.sortVar = "date"
    @collection.sort()
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
  		
