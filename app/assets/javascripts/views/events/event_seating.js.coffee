class Qwikstubs.Views.EventSeating extends Backbone.View
  template: JST['events/event_seating']
  
  seats_selectable: false
  selected_seats: []

  #events:
    #'order:reserve': 'reserveSeats'
   # 'click #researve-seats': 'reserveSeats'

  tagName: 'div'
    #render: ->
    #$(@el).attr('id', 'event_seating')
    #@

  render: ->
    $(@el).html(@template())
    @

  post_render: ->
    a = @
    channel = Qwikstubs.Pusher.subscribe(@options.event.id)
    channel.bind(
      'order:reserve', 
      (data) ->
        console.log("reserve")
        a.reserve_seats(data)
        console.log(data)
      )  #@reserveSeats(data))
    channel.bind(
      'order:release',
      (data) ->
        console.log(data)
      )#@releaseSeats(data))
    channel.bind(
      'order:purchase',
      (data) ->
        console.log(data)
      )
      #@purchaseSeats(data))

  load_seats: ->
    #console.log(@options.seats)
    @stage = new Kinetic.Stage({
        container: 'event_seating'
        width: 500
        height: 800
      })
    @layer = new Kinetic.Layer()
    #console.log(@)
    @options.seats.each(@load_seat, @)
    #@layer.setScale(2,2)
    @stage.add(@layer)

    #console.log(@layer.getSize())
    #console.log(@)
  
  load_seat: (seat) -> 
    # console.log(@)
    # console.log(seat)
   # console.log(seat.get("event_seat").event_section_id)
   # console.log(collection2)
    x = seat.get("venue_seat").xpos + @options.sections.get(seat.get("event_seat").event_section_id).get("venue_section").xpos
    y = seat.get("venue_seat").ypos + @options.sections.get(seat.get("event_seat").event_section_id).get("venue_section").ypos
    
    color = "grey"
    if seat.get("event_seat").status == 1
      color = "yellow"
    if seat.get("event_seat").status == 2
       color = "red"
    console.log(seat.get("event_seat")._id)
    console.log(seat.get("event_seat").event_section_id)
    circle = new Kinetic.Circle({
        x: x
        y: y
        radius: 5
        fill: color
        stroke: 'black'
        strokeWidth: 1
        id: seat.get("event_seat")._id
      })
    t = @
    circle.on("click", () -> t.add_seat(seat.get("event_seat")._id))
    circle.on("mouseenter", () -> t.view_seat(seat.get("event_seat")._id))
    circle.on("mouseleave", () -> t.unview_seat(seat.get("event_seat")._id))
    @layer.add(circle)

  view_seat: (id) ->
    sid = "#" + id
    circle = @stage.get(sid)[0]
    circle.prevFill = circle.getFill()
    circle.setFill('blue')
    #console.log(@stage.getSize())
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
      #console.log(@selected_seats)
      @render_selected_seats()

  render_selected_seats: ->
    html = "<h3>Reserved Seats</h3><ul>"
    for id in @selected_seats
      sid = "#" + id
      circle = @stage.get(sid)[0]
      circle.setFill('green')
      seat = @options.seats.get(id)
      #console.log(seat)
      html = html + "<li>" + seat.get("venue_seat").name + "</li>"
    @layer.draw()
    html = html + "</ul>"
    $("#reserved-seats").html(html)

  reserve_seats: (data) ->
    #console.log(@stage)
    console.log(data)
    #console.log(@layer)
    for id in data
      sid = "#" + id.id
      #console.log(sid)
      #console.log(@stage.get(sid)[0])
      @stage.get(sid)[0].setFill('blue')
    @layer.draw()
    console.log("Draw seat!")
    console.log(data)

  releaseSeats: (data) ->
    for id in data
      sid = "#" + id
      @stage.get(sid)[0].setFill('green')
    @layer.draw()
    #console.log(data)

  purchaseSeats: (data) ->
    #console.log(data)


  
