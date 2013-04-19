class EventsController < ApplicationController
  respond_to :json

  def index
    respond_with Event.all
  end  
  
  def list
    if page = params[:page]
      puts page
      respond_with Event.all
    else
      respond_with Event.all
    end
  end
  
  def show
    respond_with Event.find_by_name(params[:name])
  end
  
  def create
    respond_with Event.create(params[:event])
  end
  
  def update
    respond_with Event.update(params[:id], params[:entry])
  end
  
  def delete
    
  end
  
  def new
    
  end
  
  def edit
    
  end
  
end
