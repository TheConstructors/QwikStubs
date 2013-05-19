class Qwikstubs.Routers.Events extends Backbone.Router
  routes:
    'events': 'index'
    'search/events/:query': 'search'
    # 'events?sort-name=true': 'sortname'
    # 'events?sort-date=true': 'sortdate'
    'events/:id': 'show'
    #'events/buy/:id': 'buy'
    'events/seating/:id': 'seating'
  
  initialize: ->
    @collection = new Qwikstubs.Collections.Events()
    @collection.fetch()
    #@listenTo(@eventIndex.collection, 'reset', @index)

  
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

  seating: (id) ->
    eventm = new Qwikstubs.Models.Event({id:id})
    seats = new Qwikstubs.Collections.Seats()
    seats.url = "/api/events/seats/" + id
    sections = new Qwikstubs.Collections.Sections()
    sections.url = "/api/events/sections/" + id
    complete = () =>
      console.log("second")
      view = new Qwikstubs.Views.EventsSeating(seats: seats, sections: sections, event:eventm)
      channel = Qwikstubs.Pusher.subscribe(id)
      channel.bind('order:reserve', (data) ->
        view.reserveSeats(data))

      channel.bind('order:release', (data) ->
        view.releaseSeats(data))

      channel.bind('order:purchase', (data) ->
        view.purchaseSeats(data))

      $('#container').html(view.render().el)
      view.draw()

    console.log("first")
    success = _.after(3, complete);   
    eventm.fetch({success: success})
    seats.fetch({success: success})
    sections.fetch({success: success})


  show: (id) ->
    eventm = new Qwikstubs.Models.Event({id:id})
    eventm.fetch({
      success: ->
        venue = new Qwikstubs.Models.Venue({id:eventm.get('venue_id')})
        venue.fetch({
          success: -> 
            view = new Qwikstubs.Views.EventsShow(event: eventm , venue: venue)
            $('#container').html(view.render().el)
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

