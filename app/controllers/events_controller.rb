class EventsController < ApplicationController
  respond_to :json
  
  def search
    #ask andrew why post's aren't working
    #debugger
    query_text = params[:qtext]
    page = params[:page]
    query = Event.search do
      fulltext query_text #query_text
      paginate :page => page, :per_page => 20
    end
    respond_with query.results.to_a
  end

  def index
    if page = params[:page]
      page_size = params[:pagesize] || 20
      results = Event.paginate({ 
        :order => :created_at.asc, 
        :per_page => page_size, 
        :page => page
      })
      respond_with results
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
end
