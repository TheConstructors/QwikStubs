class Qwikstubs.Routers.Orders extends Backbone.Router
  routes:
    'order/:id': 'show'
   
  show: (id) ->
  	view = new Qwikstubs.Views.OrderShow(order_id:id)
  	$('#container').html(view.render().el)