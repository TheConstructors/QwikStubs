require 'spec_helper'

describe EventSection do
  
  before(:each) do
    @s = FactoryGirl.create(:section, name:"21G")
    @e = FactoryGirl.create(:event, name:"CS: The Musical")
    @esec = FactoryGirl.create(:event_section, section: @s, event: @e)
  end
  
  it "should have a price" do
    @esec.errors[:price].should be_empty
    @esec.price.should == 89.99
  end

  it "should belong to a section @s" do
    @esec.section.should_not be_nil
    @esec.section.name.should == "21G"
  end

  it "should belong to an event @e" do
   @esec.event.should_not be_nil
   @esec.event.name.should == "CS: The Musical"
   @esec.event.month.should == "Feb"
   @esec.event.day.should == "28"
   @esec.event.year.should == "2014"
   @esec.event.time.should == "1:00pm"
   @esec.event.description.should == "It's Awesome!"
  end
  
  it "should have a unique combination of an event and section" do 
    @esec2 = EventSection.new(event: @e, section:  @s)
    @esec2.save.should be_false
  end
end
