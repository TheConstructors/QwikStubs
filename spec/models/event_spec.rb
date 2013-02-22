require 'spec_helper'

describe Event do
 
  before(:each) do
    @e = Event.create!(name:"Rock and Troll Concert", date: "1/9/14")
  end

  it "should have a name" do
    @e.errors[:name].should be_empty
  end

  it "should have a date" do
    @e.errors[:date].should be_empty
  end

  it "should be a unique combination of name and date" do
    @other = Event.new(name:"Rock and Troll Concert", date: "1/9/14")
    @other.valid?.should be_false
    @other.errors.should_not be_empty
  end

end
