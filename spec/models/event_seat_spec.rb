require 'spec_helper'

describe EventSeat do
  before(:each) do
    @eseat = EventSeat.create!(status:EventSeat::Stat::SOLD)
  end

  it "should have a status" do
    @eseat.errors[:status].should be_empty
  end
end
