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
    @collection = new Qwikstubs.Collections.Events()
    @collection.fetch()
    @model = @collection.where({id:id})
    view = new Qwikstubs.Views.EventsShow(model: @model)
    $('#container').html(view.render().el)

  buy: (id) ->
    view = new Qwikstubs.Views.EventsBuy()
    $('#container').html(view.render().el)
