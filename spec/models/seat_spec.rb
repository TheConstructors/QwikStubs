require 'spec_helper'

describe Seat do

  # do these actions once before all the tests
  before(:each) do
    @v = FactoryGirl.create(:venue)
    @sec = FactoryGirl.create(:section)
    @s = FactoryGirl.create(:seat)
    @s.section = @sec
  end

  it "should have a row" do
    @s.errors[:row].should be_empty
  end

  it "should have a name" do
    @s.errors[:name].should be_empty
  end

  it "should have a column" do
    @s.errors[:column].should be_empty
  end 

#  it "should be a unique combination of name, city, state" do
#    @other = Seat.new(name:"109A",row:"A",column:"9")
#    @other.valid?.should be_false
#    @other.errors.should_not be_empty
#  end
 
end
