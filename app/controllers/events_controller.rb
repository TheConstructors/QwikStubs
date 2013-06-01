class EventsController < ApplicationController
  respond_to :json
  
  def search
    query_text = params[:search]
    page = params[:page]
    # query = query.paginate :page => page, :per_page => 20
    # pagination broken -- fix me?
    respond_with Event.fuzzy_search query_text
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
      respond_with @events_found
    end
  end  
  
  def list
    respond_with Event.all 
  end
  
  def show
    respond_with Event.find(params[:id])
  end
  
  def create
    respond_with Event.create(params[:event])
  end
  
  def update
    respond_with Event.update(params[:id], params[:entry])
  end
  
  def seats
    @event = Event.find(params[:id])
    @seats = EventSeat.get_seats(@event)
    #@seats = []
    respond_with @seats.as_json
  end

  def sections
    @event = Event.find(params[:id])
    @sections = []
    @event.event_sections.each do |event_section|
      @sections << {id: event_section.id, venue_section: event_section.section, event_section: event_section}
    end
    respond_with @sections.as_json
  end

  def order_reserve_mock
    @event = Event.find(params[:id])
    order_num = (Order.last && Order.last.order_number) || 1
    @order = Order.new event: @event, order_number: order_num, total_amount: params[:total]
    @order.trigger_reserve
    respond_with ""
  end

  def order_release_mock
    @event = Event.find(params[:id])
    order_num = (Order.last && Order.last.order_number) || 1
    @order = Order.new event: @event, order_number: order_num, total_amount: params[:total]
    @order.trigger_release
    respond_with ""
  end

  def delete
  end
  
  def new
    
  end
  
  def edit 
  end
end

