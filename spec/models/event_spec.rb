require 'spec_helper'

describe Event do
 
  before(:each) do
    @v = FactoryGirl.create(:venue, name:"House of Blues", city: "SD", state:"CA")
    @p = FactoryGirl.create(:promoter, name:"NHL")
    @e = FactoryGirl.create(:event, name:"Rock and Troll Concert", time: "8:30PM", venue:@v, promoter:@p)
  end

  it "should be saved in the database" do
    @e.errors[:name].should be_empty
    @e.errors[:month].should be_empty
    @e.errors[:day].should be_empty
    @e.errors[:year].should be_empty
    @e.errors[:time].should be_empty
    @event = Event.find_by_name("Rock and Troll Concert");
    @event.should_not be_nil
    @event["time"].should == "8:30PM"
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
