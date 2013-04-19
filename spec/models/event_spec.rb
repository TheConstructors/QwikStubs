require 'spec_helper'

describe Event do
 
  before(:each) do
    @v = Venue.create!(name:"House of Blues", city: "SD", state:"CA")
    @p = Promoter.create!(name:"NHL")
    @e = Event.create!(name:"Rock and Troll Concert", date: "1/9/14", time: "8:30PM", venue:@v, promoter:@p)
  end

  it "should have a name" do
    @e.errors[:name].should be_empty
  end

  it "should have a date" do
    @e.errors[:date].should be_empty
  end
  
  it "should have a time" do
    @e.errors[:time].should be_empty
  end
  
  it "should be a unique combination of name and date" do
    @other = Event.new(name:"Rock and Troll Concert", date: "1/9/14")
    @other.valid?.should be_false
    @other.errors.should_not be_empty
  end
  
  it "should belong to a venue @v" do
    @e.venue.name.should == "House of Blues"
    @e.venue.city.should == "SD"
    @e.venue.state.should == "CA"
  end
  
  it "should belong to a promoter @p" do
    @e.promoter.name.should == "NHL"
  end


end
