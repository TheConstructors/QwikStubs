class EventController < ApplicationController
  respond_to :json

 def new
    respond_with Event.new
  end 

  def create
    respond_with Event.create(params[:event])
  end 

  def list
    respond_with Event.all
  end 

 # Show specific Event
 #NOTE: Should we be able to show a specifc event by date? If so, how do we do that exactly?
  def show
    respond_with Event.find_by_name(params[:name])
  end

  # Edit a single event
  def edit
  end

  # Edit Logic
  def update
  end

  # Delete a User (probably not gonna be used)
  def destroy
  end
end
