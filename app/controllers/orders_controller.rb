class OrdersController < ApplicationController
  include ApplicationModel

  # Create should generate a new order with correct info
  def create
  end
  
  # Update should allow us to modify the order to be completed, or modify some aspect of it like
  # willcall, printing, ect.
  def update
  end
  
  # Destroy should release an Order's ticket back into the pool, firing the correct event.
  def destroy
  end
end
