class Qwikstubs.Routers.Events extends Backbone.Router
  routes:
    'events': 'index'
    'events/:id': 'show'
    'events/buy/:id': 'buy'

  
  initialize: ->
    @collection = new Qwikstubs.Collections.Events()
    @collection.fetch()
    @eventIndex = new Qwikstubs.Views.EventsIndex(collection: @collection)
    #@listenTo(@eventIndex.collection, 'reset', @index)

  index: ->
    @collection.fetch() # investigate in the future
    @collection.previousPage()
    $('#container').html(@eventIndex.render().el)

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

  buy: (id) ->
    view = new Qwikstubs.Views.EventsBuy()
    $('#container').html(view.render().el)
