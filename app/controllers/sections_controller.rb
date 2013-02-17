class SectionsController < ApplicationController
  def new
    @section = Section.new
  end
  
  def create
    @section = Section.new(params[:section])
     if @section.save
      redirect_to root_path # change to better location later
    else
      flash.now[:error] = "Something went wrong - please check your fields and try again!"
      render :new
    end
  end 

  def list
    @sections = Section.all
  end 

  # Show specific User
  def show
    @section = Section.find_by_name(params[:name])
  end

  # Edit a single User (UI)
  def edit
  end

  # Edit Logic
  def update
  end

  # Delete a User (probably not gonna be used)
  def destroy
  end


end
