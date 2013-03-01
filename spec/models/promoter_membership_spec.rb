require 'spec_helper'

describe PromoterMembership do
  it "should have a role" do
    @promoter_membership = PromoterMembership.new(role:"Admin")
    @promoter_membership.role.should == "Admin"
    end
end
