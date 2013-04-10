require 'spec_helper'

describe PromoterMembership do

  before(:each) do
    @p_m = FactoryGirl.create(:promoter_membership)
  end
      
  it "should have a role" do
    @p_m.role.should_not be_empty
  end
  
  it "should be associated with one user" do
    @p_m.user.should_not be_nil
  end
  
  it "should be associated with one promoter" do
    @p_m.promoter.should_not be_nil
  end
      
end
