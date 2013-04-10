require 'spec_helper'

describe EventSection do
  
  before(:each) do
    @e = Event.create!(name:"Computer Science: The Musical", date: "5/30/14")
    @s = Section.create!(name:"21F")
  end
  
  it "should have a price" do
    @s = Section.create!(name:"stupid poop")
    @es = EventSection.create!(price: 85.00, event: @e, section: @s)
    @es.errors[:price].should be_empty
  end

  it "should belong to a section @s" do
    @es = EventSection.create!(price: 75.00, event: @e, section: @s)
    @es.section.name.should == "21F"
  end

  it "should belong to an event @e" do
    @es = EventSection.create!(price: 85.00, event: @e, section: @s)
    @es.event.name.should == "Computer Science: The Musical"
    @es.event.date.should == "5/30/14"
  end
  
  it "should have a unique combination of an event and section" do 
    @es = EventSection.new(event: @e, section: @s); @es.save
    @es_two = EventSection.new(event: @e, section: @s)
    @es_two.save.should be_false
  end
end
