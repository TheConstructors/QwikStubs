require 'spec_helper'

describe Seat do

  # do these actions once before all the tests
  before(:each) do
    @s = FactoryGirl.create(:seat)
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
#    @other = FactoryGirl.build(:seat, name: @s.name, section: @s.section)
#    @other.valid?.should be_false
#    @other.errors.should_not be_empty
#    @section = FactoryGirl.create(:section)
#    @other.section = @section
#    @other.valid?.should be_true
#    @other.errors.should be_empty
#  end 
end
