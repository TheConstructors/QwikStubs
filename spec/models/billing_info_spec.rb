require 'spec_helper'

describe BillingInfo do
  
  before(:each) do
    @binf = FactoryGirl.create(:billing_info)
  end
  
  it "should have a full name" do
    @binf.full_name.should_not be_nil
  end
  
  it "should have an address" do
     @binf.address.should_not be_nil
  end
  
  it "should have a city" do
    @binf.city.should_not be_nil
  end
  
  it "should have a state" do
   @binf.state.should_not be_nil
  end
  
  it "should have a zip" do
     @binf.zip.should_not be_nil
  end
  
  it "should have a verification status" do
     @binf.verified.should_not be_nil
     @binf.verified.should == true
  end
  
  it "should have a ccn of length 16" do
     @binf.errors[:ccn].should be_empty
  end
  
  it "should be associated with one user" do
      @binf.user.should_not be_nil
  end
  
end
