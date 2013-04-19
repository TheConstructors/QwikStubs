require 'spec_helper'

describe VenueMembership do
  before(:each) do
    @v_m = FactoryGirl.create(:venue_membership)
  end

  it "should have a role" do
    @v_m.role.should_not be_empty    
  end

  describe "promoter" do
    it "should be present" do
      @v_m.promoter.should_not be_nil
    end

    it "should already exist in the db" do
      @venue1 = FactoryGirl.build(:venue)
      @v_m2 = VenueMembership.create(role: "owner", venue: @venue1, promoter: Promoter.new)
      @v_m2.valid?.should be_false
      @v_m2.errors.should_not be_empty
    end
  end

  it "should be associated with a venue" do
    @v_m.venue.should_not be_nil
  end

end
