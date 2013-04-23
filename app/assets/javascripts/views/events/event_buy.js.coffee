class Qwikstubs.Views.EventBuy extends Backbone.View

  template: JST['events/buy']

  events:
    'click .purchase': 'boughtTickets'

  render: ->
    $(@el).html(@template())
    @

  boughtTickets: ->
    $('#buy').html('<div class="white-box"><h3>Success! You have bought your tickets!</h3></div>')

