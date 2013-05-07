require 'spec_helper'

describe Event do
 
  before(:each) do
    @v = FactoryGirl.create(:venue, name:"House of Blues", city: "SD", state:"CA")
    @p = FactoryGirl.create(:promoter, name:"NHL", verified:true)
    @e = FactoryGirl.create(:event, venue:@v, promoter:@p)
  end

  it "should be saved in the database" do
    @e.errors[:name].should be_empty
    @e.errors[:month].should be_empty
    @e.errors[:day].should be_empty
    @e.errors[:year].should be_empty
    @e.errors[:time].should be_empty
    @e.errors[:date].should be_empty
    @e.should_not be_nil
    @e.time.should == "1:00pm"
  end

  
  it "should be a unique combination of name and date" do
    @other = FactoryGirl.build(:event, name:@e.name, date:@e.date)
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

  describe "generateGroups" do
    it "should return false if groups exist for this event" do
      @g = FactoryGirl.create(:group, event: @e)
      #@e.generateGroups().should == false
    end

    it "should create groups for all seats not sold for event" do

    end
  end
end
