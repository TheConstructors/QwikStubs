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
        console.log(@eventIndex)
        $('#container').html(@eventIndex.render().el)
    })

  seating: (id) ->
    @collection = new Qwikstubs.Collections.Seats()
    @collection.url = "/api/events/seats/" + id
    channel = Qwikstubs.Pusher.subscribe(id)
    @collection.fetch({
      success: (@collection) ->
        @collection2 = new Qwikstubs.Collections.Sections()
        @collection2.url = "/api/events/sections/" + id
        @collection2.fetch({
          success: (@collection2) ->
            console.log(@collection2)
            view = new Qwikstubs.Views.EventsSeating(collection: @collection, collection2: @collection2)
            channel.bind('order:reserve', (data) ->
              view.reserveSeats(data))

            channel.bind('order:release', (data) ->
              view.releaseSeats(data))

            channel.bind('order:purchase', (data) ->
              view.purchaseSeats(data))

            $('#container').html(view.render().el)
            view.draw()
        })
      })



  show: (id) ->
    @collection.fetch({
      success: (@collection) ->
          @model = @collection.get(id)
          @collectionV = new Qwikstubs.Collections.Venues()
          @collectionV.fetch({
            success: (@collectionV) ->
              @model2 = @collectionV.get(@model.get('venue_id'))
              view = new Qwikstubs.Views.EventsShow(model: @model, model2: @model2)
              $('#container').html(view.render().el)
          })
          
    })
    
    
  #buy: (id) ->
   # view = new Qwikstubs.Views.EventsBuy()
    #$('#container').html(view.render().el)
    #
    #

