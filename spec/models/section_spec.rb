require 'spec_helper'

describe Section do
  before(:each) do
    @v = Venue.create(name:"THE KYLEBOWL", city: "SB", state:"CA")
    @s = Section.create(name:"22F", venue:@v)
  end

  it "should have a name" do
    @s.errors[:name].should be_empty
  end

  it "should have a non-null venue" do
    @s.venue.should_not == nil
  end

  it "should correspond to the venue with which it was created" do
    @s.venue.name.should == @v.name
  end

end
