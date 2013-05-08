class Qwikstubs.Collections.Events extends Backbone.Collection
  model: Qwikstubs.Models.Event
  url: '/api/events?page=1'
  
  initialize: ->
    @page = 1
    this.sortVar = "date"
    # call this function to load the previous button to "disabled"
    @previousPage() 


  comparator: (collection) ->
    return collection.get(this.sortVar)    

  nextPage: ->
    @page += 1
    @url = "/api/events?page=#{@page}"
    @fetch(reset: true)
    $('html, body').animate({ scrollTop: 0 }, 0);


  currentPage: ->
    @url = "/api/events?page=#{@page}"
    @fetch(reset: true)
    $('html, body').animate({ scrollTop: 0 }, 0);

  previousPage: ->
    # handle more pages and less pages
    if @page isnt 1
      @page -= 1
      @url = "/api/events?page=#{@page}"
      @fetch(reset: true)
      $('html, body').animate({ scrollTop: 0 }, 0);
    else
      $('#previous-page').addClass("disabled")


  # showEvent: ->
  #     console.log(@model)
  #     Backbone.history.navigate("events/#{@model.id}", true)

  #model: Qwikstubs.Models.Venue

    
  # fetching records GET /venues
  # creating records POST /venues
  # fetching individual GET /venues/name
  # updating individual PUT /venues/name
  # remove individual DELETE /venues/name

