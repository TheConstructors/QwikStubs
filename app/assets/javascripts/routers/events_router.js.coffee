class Qwikstubs.Routers.Events extends Backbone.Router
  routes:
    'events': 'index'
    'search/events/:query': 'search'
    # 'events?sort-name=true': 'sortname'
    # 'events?sort-date=true': 'sortdate'
    'events/:id': 'show'
    #'events/buy/:id': 'buy'

  
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

