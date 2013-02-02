require 'spec_helper'

describe Venue do
  
  # do these actions once before all the tests
  before(:all) do
    MongoMapper.database.collections.each do |coll|
      coll.remove
    end
    @v = Venue.create!(name:"SB Bowl",city:"SB",state:"CA")
  end

  it "should have a city" do
    @v.errors[:city].should be_empty
  end

  it "should have a name" do
    @v.errors[:name].should be_empty
  end

  it "should have a state" do
    @v.errors[:state].should be_empty
  end 

  it "should be a unique combination of name, city, state" do
    @other = Venue.new(name:"SB Bowl",city:"SB",state:"CA")
    @other.valid?.should be_false
    @other.errors.should_not be_empty
  end
 
end
