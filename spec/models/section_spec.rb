require 'spec_helper'

describe Section do
  before(:each) do
    @s = FactoryGirl.create(:section, name:"22F")
  end

  it "should have a name" do
    @s.errors[:name].should be_empty
  end

  it "should have a non-null venue" do
    @s.venue.should_not == nil
  end

  it "should correspond to the venue with which it was created" do
    @s.venue.name.should_not == nil
  end

  it "should be a unique combination of name, city, state" do
    @other = FactoryGirl.build(:section, name: @s.name, venue: @s.venue)
    @other.valid?.should be_false
    @other.errors.should_not be_empty
  end

end
