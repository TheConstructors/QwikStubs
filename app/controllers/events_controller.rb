class EventsController < ApplicationController
  respond_to :json

  def index
    if params.index :page
      respond_with Event.paginate filter_p(params, :page, :per_page, :order)
    else
      respond_with Event.all
    end
  end  
  
  def list
    respond_with Event.all 
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
  
  def filter_p(hash, *keys)
    hash.select { |k, v| keys.index(k) != nil }  
  end
end
