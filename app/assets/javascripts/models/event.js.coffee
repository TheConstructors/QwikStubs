class Qwikstubs.Models.Event extends Backbone.Model
  reserveSeats: (num) ->
    $.get("/api/events/order/reserve/#{@id}/#{num}")

  releaseSeats: (num) ->
    $.get("/api/events/order/release/#{@id}/#{num}")

  purchaseSeats: (num) ->
    # does nothing for now


