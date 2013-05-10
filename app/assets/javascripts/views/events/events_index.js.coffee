class Qwikstubs.Views.EventsIndex extends Backbone.View
  tagName: 'div'

  template: JST['events/index']
  downD = true
  downE = false
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
    downD = true
    downE = false
    @collection.nextPage()
  
  previousPage: ->
    downD = true
    downE = false
    @collection.previousPage()
    
  sortname: ->
    switch @collection.sortVar
      when "date"
        @collection.sortVar = "name"
        @collection.sort()
        @render()
        $('#sort-name').html("Event &#9660;")
        $('#sort-date').html("Date")
        downE = true
      when "name"
        @collection.models.reverse()
        @render()
        if downE is true
          $('#sort-name').html("Event &#9650;")
          $('#sort-date').html("Date")
          downE = false
        else
          $('#sort-name').html("Event &#9660;")
          $('#sort-date').html("Date")
          downE = true
  
  sortdate: ->
    switch @collection.sortVar
      when "name"
        @collection.sortVar = "date"
        @collection.sort(@collection.models)
        @render()
        $('#sort-date').html("Date &#9660;")
        $('#sort-name').html("Event")
        downD = true
      when "date"
        @collection.models.reverse()
        @render()
        if downD is true
          $('#sort-date').html("Date &#9650;")
          downD = false
        else
          $('#sort-date').html("Date &#9660;")
          downD = true
    
  
  # showEvent: ->
  #         @collection.showEvent()


  #createEvent: (event) ->
  	#event.preventDefault()
  	#@collection.create
  	#	name: $('#new_venue_name').val()
  	#	city: $('#new_venue_city').val()
  	#	state: $('#new_venue_state').val()
  	#$('#new_venue')[0].reset()
  		
