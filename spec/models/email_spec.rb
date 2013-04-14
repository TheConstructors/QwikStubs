require 'spec_helper'

describe Email do
  it "should allow find" do
    FactoryGirl.create(:email, email:"constructors@qwikstubs.owns")
    @email = Email.find_by_email("constructors@qwikstubs.owns")
    @email.should_not be_nil
    @email.email.should == "constructors@qwikstubs.owns"
  end
  
  it "should have a reference to user" do
    @email = FactoryGirl.build(:email)
    @email.user.should_not be_nil
  end
end
