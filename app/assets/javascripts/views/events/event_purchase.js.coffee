class Qwikstubs.Views.EventPurchase extends Backbone.View

  template: JST['events/buy']

  events:
    'submit': 'boughtTickets'
    'click .cancel': 'cancelPurchase'

  render: ->
    console.log("Rendering!")
    $(@el).html(@template())
    @

  boughtTickets: ->
    console.log("boughtTickets!")
    $('#buy').html('<div class="white-box"><h3>Success! You have bought your tickets!</h3> Refresh the page if you would like to buy more.</div>')

  cancelPurchase: ->
    console.log("cancelPurchase!")
    $('#buy').html('<div class="white-box"><h3>Purchase Canceled.</h3> Refresh the page if you would like to buy more.</div>')

