class EventController < ApplicationController

 def new
    @event = Event.new
  end 

  def create
    @event = Event.new(params[:event])

    if @event.save
      redirect_to '/event'
    else
      flash.now[:error] = "Something went wrong - please check your fields and try again!"
      render :new
    end
  end 

 def list
    @event = Event.all
  end 

 # Show specific Event
 #NOTE: Should we be able to show a specifc event by date? If so, how do we do that exactly?
  def show
    @event = Event.find_by_name(params[:name])
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
