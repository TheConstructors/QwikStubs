require 'spec_helper'

describe Promoter do

  before(:each) do
    @p = FactoryGirl.create(:promoter, name: "The Constructors")
  end

  it "should have a name" do
    @p.errors[:name].should be_empty
  end

  it "should fail if there is no name" do
    @no_name = Promoter.create(name: "")
    @no_name.errors[:name].should_not be_empty
  end

  it "should have a verification status" do
    @p.verified.should_not be_nil
    @p.errors[:verified].should be_empty
  end
  
  it "should have a unique name" do
    @p2 = Promoter.create(name: "The Constructors")
    @p2.errors[:name].should_not be_empty  
  end

end
