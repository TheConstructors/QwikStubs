class Qwikstubs.Views.EventPurchase extends Backbone.View

  template: JST['events/purchase']



  events:
    'submit': 'boughtTickets'
    'click .cancel': 'cancelPurchase'

    'click #select': 'select'
    'click #best' : 'best'
    'click #best_1' : 'best_1'
    'click #best_2' : 'best_2'
    'click #best_3' : 'best_3'
    'click #best_4' : 'best_4'
    'click #best_5' : 'best_5'
    'click #best_6' : 'best_6'
    'click #best_7' : 'best_7'
    'click #best_8' : 'best_8'
    'click #best_c' : 'best_c'
  
  render: ->
    console.log("Rendering!")
    $(@el).html(@template())
    @

  post_render : ->
    @best()
    @seating = new Qwikstubs.Views.EventSeating
      seats: @options.seats
      sections: @options.sections
      event: @options.event
    $('#seating').html(@seating.render().el)
    @seating.post_render()
    @seating.load_seats()


  select: ->

  best: -> 
    purchase_best_1 = JST['events/purchase_best']
    $('#purchase').html(purchase_best_1())

  boughtTickets: ->
    console.log("boughtTickets!")
    $('#buy').html('<div class="white-box"><h3>Success! You have bought your tickets!</h3> Refresh the page if you would like to buy more.</div>')

  cancelPurchase: ->
    console.log("cancelPurchase!")
    $('#buy').html('<div class="white-box"><h3>Purchase Canceled.</h3> Refresh the page if you would like to buy more.</div>')

  best_1 :-> @best_f(1)
  best_2 :-> @best_f(2)
  best_3 :-> @best_f(3)
  best_4 :-> @best_f(4)
  best_5 :-> @best_f(5)
  best_6 :-> @best_f(6)
  best_7 :-> @best_f(7)
  best_8 :-> @best_f(8)

  best_f : (num)->
    $('#purchase').html('<div class="white-box"><h3 style="text-align:center;">Finding Your Seats!</h3></div>')
    console.log(@options.order)
    order = @options.order
    a = @
    run = (x,y,z)->
      a.best_c()
    @options.order.save({type:"best",num:num}, {success:(order,response,options)->run(order,response,options)})
  
  best_c : () ->
    a = @options
    console.log("success")
    order = @options.order
    order_seats = new Backbone.Collection()    
    order_seats.url = '/api/orders/seats/' + order.id
    after = () ->
      total = 0
      out = '<h4 style="text-align:center;"><span class="pull-left">Seat</span><span class="pull-right">Price</span><br><hr style="margin:0px;">'
      display_seat = (seat) -> 
        console.log a.seats.get(seat.id)
        s = a.seats.get(seat.id)
        price = a.sections.get(s.get("event_seat").event_section_id).get("event_section").price
        total = total + price
        name = a.seats.get(seat.id).get("venue_seat").name
        out = out + "<span class='pull-left'>" +name + "</span><span class='pull-right'>" + price+ "</span><br>"
      order_seats.each(display_seat)
        # console.log(x)
        # 
      out = out + '<hr style="margin:0px;"><span class="pull-left">Total</span><span class="pull-right"> $' + total + '</span>'
      out = out+ '</h4><br><br>'

      total = total*100 
      $('#purchase').html(JST['events/purchase_checkout'](order:order, total:total))
      
      # This is a hack to make the purchase tickets button appear after you type in a valid email address

      
      $("#stripeemailabc").keyup () ->
        re = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/
        console.log $("#stripeemailabc").val()
        result = re.test($("#stripeemailabc").val())
        console.log(result)
        if result
          $("#stripebuttonabc button").addClass("btn")
          $("#stripebuttonabc button").addClass("btn-primary")
          $("#stripeemailval").val($("#stripeemailabc").val())
          $("#stripebuttonabc").css("visibility", "visible")
        else
          $("#stripebuttonabc").css("visibility", "hidden")


      
      

      $('#reserved-seats').html(out)
    order_seats.fetch({success: after})