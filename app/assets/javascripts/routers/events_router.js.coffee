class Qwikstubs.Routers.Events extends Backbone.Router
  routes:
    'events': 'index'
    'events/:id': 'show'

  initialize: ->
    @collection = new Qwikstubs.Collections.Events()
    @collection.fetch()

  index: ->
    @collection = new Qwikstubs.Collections.Events()
    @collection.fetch()
    view = new Qwikstubs.Views.EventsIndex(collection: @collection)
    $('#container').html(view.render().el)

  show: (name) ->
    @collection = new Qwikstubs.Collections.Events()
    @collection.fetch()
    @model = @collection.where({name:name})
    view = new Qwikstubs.Views.EventsShow(model: @model)
    $('#container').html(view.render().el)