class EventsController < ApplicationController
  respond_to :json

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
    @event = Event.create(params[:event])
    # error checking here
    venue = @event.venue
    venue.sections.each do |section|
      es = EventSection.create :section => section, :event => @event
      section.seats.each do |seat|
        EventSeat.create :event_section => es, :seat => seat
      end
    end
    respond_with @event
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
