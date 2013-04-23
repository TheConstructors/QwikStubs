require 'spec_helper'

describe Event do
 
  before(:each) do
    @v = Venue.create!(name:"House of Blues", city: "SD", state:"CA")
    @p = Promoter.create!(name:"NHL", verified:true)
    @e = FactoryGirl.create(:event, venue:@v, promoter:@p)
    
    
  end

  it "should be saved in the database" do
    @e.errors[:name].should be_empty
    @e.errors[:month].should be_empty
    @e.errors[:day].should be_empty
    @e.errors[:year].should be_empty
    @e.errors[:time].should be_empty
    @e.should_not be_nil
    @e.time.should == "1:00pm"
  end

  
  it "should be a unique combination of name and date" do
    @other = Event.new(name:@e.name, month:@e.month)
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
