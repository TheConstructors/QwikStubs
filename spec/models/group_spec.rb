require 'spec_helper'

describe Group do
  before(:each) do
    @g = FactoryGirl.build(:group)
  end

  it "should be a valid group" do
    @g.valid?.should == true
  end

  it "should be invalid when size and event_seats not matching" do
    @g2 = FactoryGirl.build(:group, size: 10)
    @g2.valid?.should == false
  end

#  it "should correspond to the venue with which it was created" do
#    @event = FactoryGirl.create(:event)
#    @event2 = FactoryGirl.create(:event)
#    @section = FactoryGirl.create(:event_section, event: @event2)
#    @g2 = FactoryGirl.build(:group, size: 1, event: @event)
#    @g2.valid?.should == false
#    @seat = FactoryGirl.create(:event_seat, event_section: @section, group: @g2)
#    @g2.valid?.should == true
#  end
end
