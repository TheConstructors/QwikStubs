class EventController < ApplicationController

 def new
    @venue = Venue.new
  end 

end
