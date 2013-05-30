class OrdersController < ApplicationController
  respond_to :json

  # Create should generate a new order with correct info
  def create
    # puts params
    @order = Order.new(params[:order])
    seats = []
    params[:seats].each do |seat|
      puts seat
      puts Seat.find_by_id(seat)
    end
    
    if(@order.reserve_seats(seats))
      responds_with @order.save()
    else
      responds_with ""
    end
  end
  
  # Update should allow us to modify the order to be completed, or modify some aspect of it like
  # willcall, printing, ect.
  def update
  end
  
  # Destroy should release an Order's ticket back into the pool, firing the correct event.
  def destroy

  end
end