require 'spec_helper'

describe EventSeat do
  before(:each) do
    @eseat = FactoryGirl.create(:event_seat)
  end

  it "should have a status" do
    @eseat.errors[:status].should be_empty
    @eseat.status.should == EventSeat::Status::SOLD
  end
  
end
