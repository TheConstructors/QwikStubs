class Qwikstubs.Models.Event extends Backbone.Model
  reserveSeat: (num) ->
    $.get("/api/events/order/reserve/#{@id}/#{num}")

  releaseSeat: (num) ->
    $.get("/api/events/order/release/#{@id}/#{num}")


