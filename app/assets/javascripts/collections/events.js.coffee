class Qwikstubs.Collections.Events extends Backbone.Collection
  initialize: ->
    @page = 1

  url: '/api/events?page=1'

  nextPage: ->
    @page += 1
    @url = "/api/events?page=#{@page}"
    @fetch(reset: true)

  previousPage: ->
    # handle more pages and less pages
    @page -= 1
    @url = "/api/events?page=#{@page}"
    @fetch(reset: true)
  #model: Qwikstubs.Models.Venue
  
  # fetching records GET /venues
  # creating records POST /venues
  # fetching individual GET /venues/name
  # updating individual PUT /venues/name
  # remove individual DELETE /venues/name

