class Qwikstubs.Routers.Events extends Backbone.Router
  routes:
    'event': 'index'
    'events/:id': 'show'
   
  index: ->
    @collection = new Qwikstubs.Collections.Events()
    @collection.fetch()
    view = new Qwikstubs.Views.EventsIndex(collection: @collection)
    $('#container').html(view.render().el)

  show: (id) ->
    alert "Event #{id}"