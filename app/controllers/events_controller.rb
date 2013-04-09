class EventsController < ApplicationController
  respond_to :json
  
  class EventsController < ApplicationController
    respond_to :json
    def index
      respond_with Event.all
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
  
  #def new
  #   @event = Event.new
  #  end 

  #def create
  #  @event = Event.new(params[:event])

  #  if @event.save
  #    redirect_to '/event'
  #  else
  #    flash.now[:error] = "Something went wrong - please check your fields and try again!"
  #    render :new
  #  end
  #end 

  #def list
  #  @events = Event.all
  #end 

  # Show specific Event
  #NOTE: Should we be able to show a specifc event by date? If so, how do we do that exactly?
  #def show
  #  @event = Event.find_by_name(params[:name])
  #end

end
