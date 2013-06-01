class Qwikstubs.Views.EventPurchase extends Backbone.View

  template: JST['events/buy']

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
  
  render: ->
    console.log("Rendering!")
    $(@el).html(@template())
    @

  select: ->

  

  boughtTickets: ->
    console.log("boughtTickets!")
    $('#buy').html('<div class="white-box"><h3>Success! You have bought your tickets!</h3> Refresh the page if you would like to buy more.</div>')

  cancelPurchase: ->
    console.log("cancelPurchase!")
    $('#buy').html('<div class="white-box"><h3>Purchase Canceled.</h3> Refresh the page if you would like to buy more.</div>')

  best: -> 
    @template = JST['events/purchase_best']
    $(@el).html(@template())

  best_1 :-> @best_find(1)
  best_2 :-> @best_find(2)
  best_3 :-> @best_find(3)
  best_4 :-> @best_find(4)
  best_5 :-> @best_find(5)
  best_6 :-> @best_find(6)
  best_7 :-> @best_find(7)
  best_8 :-> @best_find(8)

  best_find : (num)->
   #$('#buy').html('<h3 style="text-align:center;"">Searching</h3>')
    console.log(@options.order)
    order = @options.order
    run = (x,y,z)->
      console.log("success")
      console.log(x)
      console.log(y)
      console.log(z)
      order_seats = new Backbone.Collection()    
      order_seats.url = '/api/orders/seats/' + order.id
      after = (order_seats) ->
        console.log(order_seats)
      order_seats.fetch({success: after(order_seats)})
    @options.order.save({type:"best",num:num}, {success:(order,response,options)->run(order,response,options)})
    
    

