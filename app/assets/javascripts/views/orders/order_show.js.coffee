class Qwikstubs.Views.OrderShow extends Backbone.View

  template: JST['orders/show']

  render: ->
    $(@el).html(@template(order_id:@options.order_id))
    @
