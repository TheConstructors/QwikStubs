require 'spec_helper'

describe PromoterMembership do

  before(:each) do
    @p_m = FactoryGirl.create(:promoter_membership)
  end
      
  it "should have a role" do
    @p_m.role.should_not be_empty
  end
  
  describe "user" do
    it "should be present" do
      @p_m.user.should_not be_nil
    end

    it "should already exist in the db" do
      @promoter1 = Promoter.new(name: "Alex Jamstra Inc.", verified: false)
      @p_m2 = PromoterMembership.create(role: "CEO", user: User.new, promoter: @promoter1)
      @p_m2.valid?.should be_false
      @p_m2.errors.should_not be_empty
    end
  end
  
  it "should be associated with one promoter" do
    @p_m.promoter.should_not be_nil
  end
      
end
