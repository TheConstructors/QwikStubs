class OrdersController < ApplicationController
  respond_to :json

  # Create should generate a new order with correct info
  def create
    event = Event.find_by_id(params[:event_id])
    puts params
    amount = 0.0
    order = Order.create(event:event, total_amount:amount.to_f)

    respond_with order
  end
  
  # Update should allow us to modify the order to be completed, or modify some aspect of it like
  # willcall, printing, ect.
  def update
    puts "params ======================"
    puts params
    puts "============================="

    if params[:type] == "select"
      params[:seats].each do |seat|
        puts seat
        puts Seat.find_by_id(seat)
      end
    end
    if params[:type] == "best"
      puts params
      puts "fjdsklfjkladsjfkladsjfk;ladsjkfjadsklfjadskljfdskljfk;ldsjfk;ladsjklfjadsklfjadsk;lfj"
      order = Order.find_by_id(params[:id])
      order.find_seats(order.event, params[:num])
      respond_with order
       #event = Event.where(:id => params[:event]).first
      # number = params[:amount]
      # order = Order.find_seats(event, number.to_f)
       #respond_with order
    end
  end
  
  # Destroy should release an Order's ticket back into the pool, firing the correct event.
  def destroy

  end

  def select_best_seats
    event = Event.where(:id => params[:event]).first
    number = params[:amount]
    @order = Order.find_seats(event, number.to_f)
    respond_with @order
  end
end
