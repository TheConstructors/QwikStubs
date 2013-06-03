class Qwikstubs.Routers.Events extends Backbone.Router
  routes:
    'events': 'index'
    'search/events/:query': 'search'
    # 'events?sort-name=true': 'sortname'
    # 'events?sort-date=true': 'sortdate'
    'events/:id': 'show'
    'events/:id/purchase': 'purchase'
    'events/seating/:id': 'seating'
  
  initialize: ->
    @collection = new Qwikstubs.Collections.Events()
  
  index: ->
    @collection.fetch({
      success: (collection) ->
        collection.currentPage()
        @eventIndex = new Qwikstubs.Views.EventsIndex(collection: collection)
        $('#container').html(@eventIndex.render().el)
    })
  
  search: (query) ->
    @collection.url = "/api/search/events?search=#{query}"
    @collection.fetch({
      success: (collection) ->
        @eventIndex = new Qwikstubs.Views.EventsIndex(collection: collection)
        $('#container').html(@eventIndex.render().el)
        collection.fetch(reset:true)
    })

  # seating: (id) ->
  #   e = new Qwikstubs.Models.Event({id:id})
  #   e_seats = new Qwikstubs.Collections.Seats()
  #   e_seats.url = "/api/events/seats/" + id
  #   e_sections = new Qwikstubs.Collections.Sections()
  #   e_sections.url = "/api/events/sections/" + id
  #   complete = () =>
  #     view = new Qwikstubs.Views.EventsSeating(seats: e_seats, sections: e_sections, event:e)
  #     channel = Qwikstubs.Pusher.subscribe(id)
  #     channel.bind('order:reserve', (data) ->
  #       view.reserveSeats(data))

  #     channel.bind('order:release', (data) ->
  #       view.releaseSeats(data))

  #     channel.bind('order:purchase', (data) ->
  #       view.purchaseSeats(data))

  #     $('#container').html(view.render().el)
  #     view.draw()

  #   success = _.after(3, complete);   
  #   e.fetch({success: success})
  #   e_seats.fetch({success: success})
  #   e_sections.fetch({success: success})

  purchase: (id) ->
    # e = event
    options = @options

    o_orders = new Qwikstubs.Collections.Orders()
    o = null

    e = new Qwikstubs.Models.Event({id:id})
    e_venue = null
    e_seats = new Qwikstubs.Collections.Seats()

    e_seats.url = "/api/events/seats/" + id
    e_sections = new Qwikstubs.Collections.Sections()
    e_sections.url = "/api/events/sections/" + id

    complete = () =>
      view = new Qwikstubs.Views.EventPurchase
        event:    e
        venue:    e_venue
        sections: e_sections
        seats:    e_seats
        order:    o
      $('#container').html(view.render().el)
      view.post_render()

    # -----------------------------------------------------
    
    success = _.after(4, complete); 
    e.fetch({
      success: ->
        e_venue = new Qwikstubs.Models.Venue({id:e.get('venue_id')})
        e_venue.fetch({success: success})
        o = o_orders.create({event_id:e.id},{success: success})
      })

    e_seats.fetch({success:success})
    e_sections.fetch({success:success})


  show: (id) ->
    eventm = new Qwikstubs.Models.Event({id:id})
    venue = null
    seats = new Qwikstubs.Collections.Seats()
    seats.url = "/api/events/seats/" + id
    sections = new Qwikstubs.Collections.Sections()
    sections.url = "/api/events/sections/" + id

    complete = () =>
      console.log("second")
      view = new Qwikstubs.Views.EventShow
        event: eventm
        venue: venue
        sections: sections
        seats:    seats
      $('#container').html(view.render().el)
      view.post_render()

    success = _.after(3, complete); 
    eventm.fetch({
      success: ->
        venue = new Qwikstubs.Models.Venue({id:eventm.get('venue_id')})
        venue.fetch({success: success})
      })

    seats.fetch({success:success})
    sections.fetch({success:success})

    




  buy: (id) ->
    eventm = new Qwikstubs.Models.Event({id:id})
    eventm.fetch({
      success: ->
        venue = new Qwikstubs.Models.Venue({id:eventm.get('venue_id')})
        venue.fetch({
          success: ->
            template = new Qwikstubs.Views.EventBuy(event: eventm , venue: venue)
            $('#container').html(template.render().el)
            seating = new Qwikstubs.Views.EventSeating(seats: seats, sections: sections, event:eventm)
            $('#seating').html(seating.render().el)
          })
      })

    
    # @collection.fetch({
    #   success: (@collection) ->
    #       @model = @collection.get(id)
    #       @collectionV = new Qwikstubs.Collections.Venues()
    #       @collectionV.fetch({
    #         success: (@collectionV) ->
    #           @model2 = @collectionV.get(@model.get('venue_id'))
    #           view = new Qwikstubs.Views.EventsShow(model: @model, model2: @model2)
    #           $('#container').html(view.render().el)
    
    #       })
          
    #})
    
    
  #buy: (id) ->
   # view = new Qwikstubs.Views.EventsBuy()
    #$('#container').html(view.render().el)
    #
    #

