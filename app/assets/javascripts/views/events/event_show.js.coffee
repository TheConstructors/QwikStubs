class Qwikstubs.Views.EventShow extends Backbone.View

  template: JST['events/show']

  render: ->
    $(@el).html(@template(event: @options.event, venue: @options.venue))
    @

  post_render : ->
    @seating = new Qwikstubs.Views.EventSeating
      seats: @options.seats
      sections: @options.sections
      event: @options.event
    $('#seating').html(@seating.render().el)
    @seating.post_render()
    @seating.load_seats() 
    $('#gmap').width($("#gmap-contain").innerWidth())
    $('#gmap').height((1/2)*$("#gmap-contain").innerWidth())
 	
    $(window).resize () ->
      $('#gmap').width($("#gmap-contain").innerWidth())
      $('#gmap').height((1/2)*$("#gmap-contain").innerWidth())
