require 'spec_helper'

describe EventSection do
  
  before do
    @e = Event.create!(name:"Computer Science: The Musical", date: "5/30/14")
    @e2 = Event.create!(name:"Computer Science: The Musical2", date: "5/30/14")
    @e3 = Event.create!(name:"Computer Science: The Musical3", date: "5/30/14")
    @s = Section.create!(name:"21F")
    @s2 = Section.create!(name:"21G")
    @s3 = Section.create!(name:"21H")
  end
  
  it "should have a price" do
    @s = Section.create!(name:"stupid poop")
    @es = EventSection.create!(price: 85.00, event: @e, section: @s)
    @es.errors[:price].should be_empty
  end

  it "should belong to a section @s" do
    @es = EventSection.create!(price: 75.00, event: @e2, section: @s2)
    @es.section.name.should == "21G"
  end

  it "should belong to an event @e" do
    @es = EventSection.create!(price: 85.00, event: @e3, section: @s3)
    @es.event.name.should == "Computer Science: The Musical3"
    @es.event.date.should == "5/30/14"
  end
  
  it "should have a unique combination of an event and section" do 
    @saved = EventSection.create(price: 95.00, event: @e, section: @s)
    @saved.should be_false
  end
end
