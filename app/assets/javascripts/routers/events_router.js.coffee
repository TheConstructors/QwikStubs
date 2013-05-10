class Qwikstubs.Routers.Events extends Backbone.Router
  routes:
    'events': 'index'
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
    @collection.sortVar = "date"
    @collection.sort()
    @collection.fetch({
      success: (@collection) ->
        @collection.currentPage()
        @eventIndex = new Qwikstubs.Views.EventsIndex(collection: @collection)
        $('#container').html(@eventIndex.render().el)
    })

  seating: (id) ->
    seats = new Qwikstubs.Collections.Seats()
    seats.url = "/api/events/seats/" + id
    seats.fetch({
      success: (seats) ->
        @model = seats.first()
        view = new Qwikstubs.Views.EventsSeating(model: @model)
        $('#container').html(view.render().el)  
        view.draw()
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
