require 'spec_helper'

describe EventSeat do
  before(:each) do
    @eseat = FactoryGirl.create(:event_seat, status: EventSeat::Status::SOLD)
  end

  it "should have a status" do
    @eseat.errors[:status].should be_empty
    @eseat.status.should == EventSeat::Status::SOLD
  end

  describe "get_seats" do
  	before(:each) do
  		@venue = FactoryGirl.create(:venue)
  		@section1 = FactoryGirl.create(:section, venue: @venue)
  		@section2 = FactoryGirl.create(:section, venue: @venue)
  		FactoryGirl.create(:seat, section: @section1)
  		FactoryGirl.create(:seat, section: @section1)
  		FactoryGirl.create(:seat, section: @section1)
  		FactoryGirl.create(:seat, section: @section1)
  		FactoryGirl.create(:seat, section: @section2)
  		FactoryGirl.create(:seat, section: @section2)
  		FactoryGirl.create(:seat, section: @section2)
  		FactoryGirl.create(:seat, section: @section2)
  		@event = FactoryGirl.create(:event, venue: @venue)
  	end

  	it "should return some" do
  		seats = EventSeat.get_seats(@event)
  		seats.size.should == 8
  		seats[0][:venue_seat]["_id"].should == seats[0][:event_seat]["seat_id"]
  	end
  end
  
end
