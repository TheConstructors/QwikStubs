require 'spec_helper'

describe EventsController do
	describe "seats" do
		before(:each) do
			@event = FactoryGirl.create(:event)
			@es = FactoryGirl.create(:event_section, event: @event)
			FactoryGirl.create(:event_seat, event_section: @es)
			FactoryGirl.create(:event_seat, event_section: @es)
			FactoryGirl.create(:event_seat, event_section: @es)
			FactoryGirl.create(:event_seat, event_section: @es)
			FactoryGirl.create(:event_seat, event_section: @es)
		end

		it "should return all the seats for the event" do
			#post :seats
			#response.should == 1

		end

	end
end
