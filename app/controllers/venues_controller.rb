class VenuesController < ApplicationController
  respond_to :json

  def index
    respond_with Venue.all
  end  

  def list
    respond_with Venue.all
  end

  def show
    respond_with Venue.find_by_name(params[:name])
  end

  def create
    respond_with Venue.create(params[:venue])
  end

  def update
    respond_with Venue.update(params[:id], params[:entry])
  end
  
  def delete
  
  end

  def new
  
  end

  def edit
  
  end


  # def new
  #   @venue = Venue.new
  # end 

  # def create
  #   @venue = Venue.new(params[:venue])

  #   if @venue.save
  #     redirect_to '/venue'
  #   else
  #     flash.now[:error] = "Something went wrong - please check your fields and try again!"
  #     render :new
  #   end
  # end 

  # def list
  #   @venues = Venue.all
  # end 

  # # Show specific User
  # def show
  #   @venue = Venue.find_by_name(params[:name])
  # end

  # # Edit a single User (UI)
  # def edit
  # end

  # # Edit Logic
  # def update
  # end

  # # Delete a User (probably not gonna be used)
  # def destroy
  # end


end
