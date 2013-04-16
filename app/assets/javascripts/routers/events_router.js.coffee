class Qwikstubs.Routers.Events extends Backbone.Router
  routes:
    'event': 'index'
    'event/:id': 'show'
   
  initialize: ->
    @collection = new Qwikstubs.Collections.Events()
    @collection.fetch()

  index: ->
    @collection = new Qwikstubs.Collections.Events()
    @collection.fetch()
    view = new Qwikstubs.Views.Events()
    #view.hey()
    $('#container').html( view.render().el)
    alert "done"

  show: (id) ->
    alert "Event #{id}"