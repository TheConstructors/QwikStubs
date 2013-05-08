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

  describe "copy_seating" do
    
    before(:each) do
      @venue = FactoryGirl.create(:venue)
      @sec = FactoryGirl.create(:section, venue: @venue)
      @seat1 = FactoryGirl.create(:seat, section: @sec)
      @seat2 = FactoryGirl.create(:seat, section: @sec)
      @seat3 = FactoryGirl.create(:seat, section: @sec)
      @e = FactoryGirl.create(:event, venue: @venue)
    end
    
    it "should copy over seating from venue" do 
      event_sections = EventSection.where(event_id: @e.id).all
      event_sections.size.should == 1
      event_seats = EventSeat.where(event_section_id: event_sections.first.id).all
      event_seats.size.should == 3
      event_seats.first.event_section_id.should == event_sections.first.id
    end
  end

  describe "generateGroups" do
    before(:each) do
      @venue = FactoryGirl.create(:venue)
      @sec = FactoryGirl.create(:section, venue: @venue)
      rows = 0..10
      columns = 0..10
      rows.each do |r|
        columns.each do |c|
          FactoryGirl.create(:seat, section: @sec, quality: 1, row: r, column: c)
        end
      end
      @e = FactoryGirl.create(:event, venue: @venue, promoter: @promoter)      
    end

    it "should return false if groups exist for this event" do
      @g = FactoryGirl.create(:group, event: @e)
      @e.generateGroups().should == false
    end

    it "should create groups for all seats not sold for event" do
      
    end
  end
end
