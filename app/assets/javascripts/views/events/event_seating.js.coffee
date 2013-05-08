class Qwikstubs.Views.EventsSeating extends Backbone.View

  #template: JST['events/show']
  tagName: 'canvas'
  #events:
  #'click .purchase' : 'buyEvent'

  #initialize: ->
    #this.event.on('reset' , @render, @ )
    #this.event.on('add' , @appendEventToList, @ )

  render: ->
    $(@el).attr('id', 'seating_canvas')
    #$(@el).id()
    @

 