require 'spec_helper'

describe VenueMembership do
  it "should have a role" do
    @venue_membership = VenueMembership.new(role:"Admin")
    @venue_membership.role.should == "Admin"
  end
end
