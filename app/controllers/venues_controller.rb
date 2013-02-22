class VenuesController < ApplicationController

  def new
    @venue = Venue.new
  end 

  def create
    @venue = Venue.new(params[:venue])

    if @venue.save
      redirect_to '/venue'
    else
      flash.now[:error] = "Something went wrong - please check your fields and try again!"
      render :new
    end
  end 

  def list
    @venues = Venue.all
  end 

  # Show specific Event
  def show
    @venue = Venue.find_by_name(params[:name])
  end

  # Edit a single Event
  def edit
  end

  # Edit Logic
  def update
  end

  # Delete a Venue
  def destroy
  end


end
