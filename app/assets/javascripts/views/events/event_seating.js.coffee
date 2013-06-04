class Qwikstubs.Views.EventSeating extends Backbone.View
  template: JST['events/event_seating']
  
  seats_selectable: false
  selected_seats: []

  #  events:
  #    'order:reserve': 'reserveSeats'
  #    'click #researve-seats': 'reserveSeats'

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
        a.reserve_seats(data)
      )
    channel.bind(
      'order:release',
      (data) ->
        console.log(data)
      )
    channel.bind(
      'order:purchase',
      (data) ->
        purchase_seats
      )

  load_seats: ->
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
  
  load_seat: (seat) -> 
    x = seat.get("venue_seat").xpos + @options.sections.get(seat.get("event_seat").event_section_id).get("venue_section").xpos
    y = seat.get("venue_seat").ypos + @options.sections.get(seat.get("event_seat").event_section_id).get("venue_section").ypos

    color = "grey"
    if seat.get("event_seat").status == 1
      color = "yellow"
    if seat.get("event_seat").status == 2
       color = "red"
    circle = new Kinetic.Circle({
        x: x
        y: y
        radius: 5
        fill: color
        stroke: 'black'
        strokeWidth: 1
        id: seat.get("event_seat")._id
      })
    circle._id = seat.get("event_seat")._id
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
    console.log(data)
    for id in data
      sid = "#" + id.id
      # console.log "RESERVING"
      # console.log id
      # console.log id.id
      # console.log @stage
      # console.log @stage.get(sid)
      # console.log @stage.get(sid)[0]
      # console.log "---------"

      @stage.get(sid)[0].setFill('yellow')
    @layer.draw()
    console.log("Draw seat!")
    console.log(data)

  releaseSeats: (data) ->
    for id in data
      sid = "#" + id
      @stage.get(sid)[0].setFill('green')
    @layer.draw()

  purchase_seats: (data) ->
    for id in data
      sid = "#" + id.id
      # console.log "RESERVING"
      # console.log id
      # console.log id.id
      # console.log @stage
      # console.log @stage.get(sid)
      # console.log @stage.get(sid)[0]
      # console.log "---------"

      @stage.get(sid)[0].setFill('red')
    @layer.draw()
    console.log("Draw seat!")
    console.log(data)


  
