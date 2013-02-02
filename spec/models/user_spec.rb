require 'spec_helper'
describe User do
  it "should have first and last name" do
    @user = User.new(first:"Alex",last:"Hamstra")
    @user.first.should == "Alex"
    @user.last.should == "Hamstra"
  end
end
