require 'spec_helper'

describe EventSection do
  
  before(:each) do
    @e = Event.create!(name:"Computer Science: The Musical", date: "5/30/14")
    @s = Section.create!(name:"21F")
    @es = EventSection.create!(price:85.00, event:@e, section:@s)
  end
  
  it "should have a price" do
    @es.errors[:price].should be_empty
  end

  it "should belong to a section @s" do
    @es.section.name.should == "21F"
  end

  it "should belong to an event @e" do
    @es.event.name.should == "Computer Science: The Musical"
    @es.event.date.should == "5/30/14"
  end
 
  #it "should have a unique combination of an event and section" do 
  # @other = EventSection.create!(price:"95.00", event:@e, section:@s)
  # @other.valid?.should be_false
  # @other.errors.should_not be_empty
  # end
  
end
