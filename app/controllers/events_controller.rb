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
    respond_with Event.create(params[:event])
  end
  
  def update
    respond_with Event.update(params[:id], params[:entry])
  end
  
  def seats
    @event = Event.find(params[:id])
    @seats = []
    @event.event_sections.each do |event_section|
      event_section.event_seats.each do |event_seat|
        seat = {"venue_seat" => event_seat.seat, "event_seat" => event_seat}
        @seats << seat
      end  
    end
    response = @seats
    respond_with response
  end

  def delete
    
  end
  
  def new
    
  end
  
  def edit
    
  end
  
end
