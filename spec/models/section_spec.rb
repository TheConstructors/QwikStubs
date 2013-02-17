require 'spec_helper'

describe Section do
  before(:each) do
    @v = Venue.create!(name:"THE KYLEBOWL", city: "SB", state:"CA")
    @s = Section.create!(name:"22F")
    @s.venue = @v
  end

  it "should have a name" do
    @s.errors[:name].should be_empty
  end

  it "venue should be non-null" do
    @s.venue.should_not == nil
  end

  it "venue section should correspond to @v" do
    @s.venue.name.should == "THE KYLEBOWL"
  end

  

  

end
