class Qwikstubs.Views.EventsSeating extends Backbone.View
  template: JST['events/event_seating']

  events:
    'order:reserve': 'reserveSeat'

  tagName: 'div'
    #render: ->
    #$(@el).attr('id', 'event_seating')
    #@

  render: ->
    $(@el).html(@template())
    @

  draw: ->
    console.log(collection)
    
    @stage = new Kinetic.Stage({
        container: 'event_seating'
        width: 578
        height: 200
      })
    @layer = new Kinetic.Layer()
    console.log(@)
    collection.each(@draw_seat, @)
    @stage.add(@layer)
    console.log(@)
 
  draw_seat: (seat) -> 
    # console.log(@)
    # console.log(seat)
    circle = new Kinetic.Circle({
        x: seat.get("venue_seat").xpos
        y: seat.get("venue_seat").ypos
        radius: 5
        fill: 'red'
        stroke: 'black'
        strokeWidth: 2
      })
    @layer.add(circle)

  reserveSeats: (data) ->
    console.log("Draw seat!")
    console.log(data)

  releaseSeats: (data) ->
    console.log(data)

  purchaseSeats: (data) ->
    console.log(data)


  
