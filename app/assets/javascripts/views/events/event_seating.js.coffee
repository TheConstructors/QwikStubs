class Qwikstubs.Views.EventsSeating extends Backbone.View
  template: JST['events/event_seating']
  
  seats_selectable: false
  selected_seats: []

  events:
    'order:reserve': 'reserveSeats'
    'click #researve-seats': 'reserveSeats'

  tagName: 'div'
    #render: ->
    #$(@el).attr('id', 'event_seating')
    #@

  render: ->
    $(@el).html(@template())
    # $("#reserve-seats").onClick({
    #   order = new Qwikstubs.Collections.Orders()
    #   Order.create({
    #     order: {

    #       }
    #     })
    #   })
    @

  load_seats: ->
    console.log(@options.seats)
    
    @stage = new Kinetic.Stage({
        container: 'event_seating'
        width: 500
        height: 800
      })
    @layer = new Kinetic.Layer()
    console.log(@)
    @options.seats.each(@load_seat, @)
    #@layer.setScale(2,2)
    @stage.add(@layer)

    console.log(@layer.getSize())
    console.log(@)
  


  load_seat: (seat) -> 
    # console.log(@)
    # console.log(seat)
   # console.log(seat.get("event_seat").event_section_id)
   # console.log(collection2)
    x = seat.get("venue_seat").xpos + @options.sections.get(seat.get("event_seat").event_section_id).get("venue_section").xpos
    y = seat.get("venue_seat").ypos + @options.sections.get(seat.get("event_seat").event_section_id).get("venue_section").ypos
    circle = new Kinetic.Circle({
        x: x
        y: y
        radius: 5
        fill: 'grey'
        stroke: 'black'
        strokeWidth: 1
        id: seat.get("event_seat").id
      })
    t = @
    circle.on("click", () -> t.add_seat(seat.get("event_seat").id))
    circle.on("mouseenter", () -> t.view_seat(seat.get("event_seat").id))
    circle.on("mouseleave", () -> t.unview_seat(seat.get("event_seat").id))
    @layer.add(circle)

  view_seat: (id) ->
    sid = "#" + id
    circle = @stage.get(sid)[0]
    circle.prevFill = circle.getFill()
    circle.setFill('blue')
    console.log(@stage.getSize())
    @layer.draw()

  unview_seat: (id) ->
    sid = "#" + id
    circle = @stage.get(sid)[0]
    circle.setFill(circle.prevFill)
    @render_selected_seats()
    @layer.draw()

  add_seat: (id) ->
    if @selected_seats.indexOf(id) == -1 && @selected_seats.length < 8
      @selected_seats.push(id)
      console.log(@selected_seats)
      @render_selected_seats()


  render_selected_seats: ->
    for id in @selected_seats
      sid = "#" + id
      circle = @stage.get(sid)[0]
      circle.setFill('yellow')
    @layer.draw()


  reserveSeats: ->
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


  
