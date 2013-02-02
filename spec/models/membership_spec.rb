require 'spec_helper'
describe Membership do
  it "should have a role" do
    @membership = Membership.new(role:"Admin")
    @membership.role.should == "Admin"
    end
end
