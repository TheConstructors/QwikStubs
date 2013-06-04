class Qwikstubs.Routers.Orders extends Backbone.Router
  routes:
    'order/:id': 'show'
   
  show: ->
  	
  	view = new Qwikstubs.Views.OrderShow()
  	$('#container').html(view.render().el)