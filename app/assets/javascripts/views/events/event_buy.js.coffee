class Qwikstubs.Views.EventBuy extends Backbone.View

  template: JST['events/buy']

  events:
    'click .purchase': 'boughtTickets'
    'click .cancel': 'cancelPurchase'

  render: ->
    $(@el).html(@template())
    @

  boughtTickets: ->
    $('#buy').html('<div class="white-box"><h3>Success! You have bought your tickets!</h3> Refresh the page if you would like to buy more.</div>')

  cancelPurchase: ->
    $('#buy').html('<div class="white-box"><h3>Purchase Canceled.</h3> Refresh the page if you would like to buy more.</div>')

