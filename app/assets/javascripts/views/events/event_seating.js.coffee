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
        width: 600
        height: 800
      })
    @layer = new Kinetic.Layer()
    console.log(@)
    collection.each(@draw_seat, @)
    @stage.add(@layer)
    console.log(@)
 
  draw_seat: (seat) -> 
    # console.log(@)
    # console.log(seat)
   # console.log(seat.get("event_seat").event_section_id)
   # console.log(collection2)
    x = seat.get("venue_seat").xpos + collection2.get(seat.get("event_seat").event_section_id).get("venue_section").xpos
    y = seat.get("venue_seat").ypos + collection2.get(seat.get("event_seat").event_section_id).get("venue_section").ypos
    circle = new Kinetic.Circle({
        x: x
        y: y
        radius: 5
        fill: 'red'
        stroke: 'black'
        strokeWidth: 2
        id: seat.get("event_seat").id
      })
    @layer.add(circle)

  reserveSeats: (data) ->
    console.log(@stage)
    console.log(@layer)
    for id in data
      sid = "#" + id
      console.log(sid)
      console.log(@stage.get(sid)[0])
      @stage.get(sid)[0].setFill('blue')
    @layer.draw()
    console.log("Draw seat!")
    console.log(data)

  releaseSeats: (data) ->
    for id in data
      sid = "#" + id
      @stage.get(sid)[0].setFill('green')
    @layer.draw()
    console.log(data)

  purchaseSeats: (data) ->
    console.log(data)


  
