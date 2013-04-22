class Qwikstubs.Routers.Events extends Backbone.Router
  routes:
    'events': 'index'
    'events/:id': 'show'
    'events/buy/:id': 'buy'

  initialize: ->
    @collection = new Qwikstubs.Collections.Events()
    @collection.fetch()

  index: ->
    @collection = new Qwikstubs.Collections.Events()
    @collection.fetch()
    view = new Qwikstubs.Views.EventsIndex(collection: @collection)
    $('#container').html(view.render().el)

  show: (id) ->
    @collection = new Qwikstubs.Collections.Events()
    @collection.fetch()
    @model = @collection.where({id:id})
    view = new Qwikstubs.Views.EventsShow(model: @model)
    $('#container').html(view.render().el)

  buy: (id) ->
    view = new Qwikstubs.Views.EventsBuy()
    $('#container').html(view.render().el)