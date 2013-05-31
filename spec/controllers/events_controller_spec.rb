require 'spec_helper'

describe EventsController do
	describe "seats" do
		before(:each) do
			@event = FactoryGirl.create(:event)
			FactoryGirl.create(:event_seat, event: @event)
			FactoryGirl.create(:event_seat, event: @event)
			FactoryGirl.create(:event_seat, event: @event)
			FactoryGirl.create(:event_seat, event: @event)
			FactoryGirl.create(:event_seat, event: @event)
		end

		it "should return all the seats for the event" do
			Post :seats
			response.should == 1

		end

	end
end
