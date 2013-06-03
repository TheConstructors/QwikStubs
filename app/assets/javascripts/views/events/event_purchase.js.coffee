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
    console.log("success")
    order = @options.order
    order_seats = new Backbone.Collection()    
    order_seats.url = '/api/orders/seats/' + order.id
    after = () ->
      $('#purchase').html(JST['events/purchase_checkout'])
      out = '<h3 style="text-align:center;">'
      test = (seat) -> 
        out = out + seat.id + "<br>"
      order_seats.each(test)
        # console.log(x)
        # 
      out = out+ '</h3>'
      out = out+ order.id
      $('#reserved-seats').html(out)
    order_seats.fetch({success: after})