class OrdersController < ApplicationController
  respond_to :json

  # Create should generate a new order with correct info
  def create
    event = Event.find_by_id(params[:event_id])
    amount = 0.0
    order = Order.create!(event:event, total_amount:amount.to_f, order_number: Order.generate_number)
    order.reload
    respond_with order
  end
  
  # Update should allow us to modify the order to be completed, or modify some aspect of it like
  # willcall, printing, ect.
  def update
    #puts "params ======================"
    #puts params
    #puts "============================="
    #debugger 

    if params[:type] == "select"
      params[:seats].each do |seat|
        puts seat
        puts Seat.find_by_id(seat)
      end
    end
    if params[:type] == "best"
      #puts params
      #puts "=============================$"
      order = Order.find_by_id(params[:id])
      #puts order
      #puts "=============================%"
      order = order.find_seats(params[:num].to_f)
      #puts order.as_json
      #puts "=============================*"
      o = [{ order: order, response: { seats: order.event_seats }}]
      #puts "RRRRREEETTYTUUURRRNNN"
      #puts o.as_json
      respond_with o.as_json #respond_with order
       #event = Event.where(:id => params[:event]).first
      # number = params[:amount]
      # order = Order.find_seats(event, number.to_f)
       #respond_with order
    end
  end
  
  def seats
    # puts "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTtt"
    # puts params
    # puts "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT"
    respond_with Order.find(params[:id]).event_seats.as_json
  end
  
  def show
  
  end
  # Destroy should release an Order's ticket back into the pool, firing the correct event.
  def destroy

  end

  def purchase
    order = Order.find_by_id(params[:id])
    puts "CHECKOUT SUCCESS **************"
    puts params

    # Stripe Stuff


    order.purchase_seats()
    redirect_to "/#order/#{params[:id]}"

  end
end
