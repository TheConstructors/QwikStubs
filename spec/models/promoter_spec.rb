require 'spec_helper'

describe Promoter do

  before(:each) do
    @p = FactoryGirl.build(:promoter)
  end

  it "should have a name" do
    @p.errors[:name].should be_empty
  end

  it "should fail if there is no name" do
    @no_name = Promoter.create(name: "")
    @no_name.errors[:name].should_not be_empty
  end

end
