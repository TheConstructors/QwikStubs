class Qwikstubs.Collections.Events extends Backbone.Collection
  initialize: ->
    @page = 1
    # call this function to load the previous button to "disabled"
    @previousPage() 

  url: '/api/events?page=1'

  nextPage: ->
    @page += 1
    @url = "/api/events?page=#{@page}"
    @fetch(reset: true)

  previousPage: ->
    # handle more pages and less pages
    if @page isnt 1
      @page -= 1
      @url = "/api/events?page=#{@page}"
      @fetch(reset: true)
    else
      $('#previous-page').addClass("disabled")
  #model: Qwikstubs.Models.Venue
  
  # fetching records GET /venues
  # creating records POST /venues
  # fetching individual GET /venues/name
  # updating individual PUT /venues/name
  # remove individual DELETE /venues/name

