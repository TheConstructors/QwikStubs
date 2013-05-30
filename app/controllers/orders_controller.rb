class OrdersController < ApplicationController
  respond_to :json

  # Create should generate a new order with correct info
  def create
    event = Event.find_by_id(params[:event_id])
    amount = 0.0
    respond_with Order.create(event:event, total_amount:amount)
  end
  
  # Update should allow us to modify the order to be completed, or modify some aspect of it like
  # willcall, printing, ect.
  def update
    if params[:type] == "select"
      params[:seats].each do |seat|
        puts seat
        puts Seat.find_by_id(seat)
      end
    end
  end
  
  # Destroy should release an Order's ticket back into the pool, firing the correct event.
  def destroy

  end

  def select_best_seats
    debugger
    event = Event.where(:id => params[:event]).first
    number = params[:amount]
    respond_with Order.find_seats(event, number)
  end
end
