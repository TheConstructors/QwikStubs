require 'spec_helper'

describe Email do
  it "should allow find" do
    email = Email.find_by_email("constructors@qwikstubs.owns")
    email.should be_nil
  end

  it "should hash the password" do

    @email = Email.new(email:"constructors@qwikstubs.owns", password:"thuglyfe")
    @email.valid?.should == false
    @email = Email.new(email:"constructors@qwikstubs.owns", password:"thuglyfe", password_confirmation:"notthesame")
    @email.valid?.should == false
    @email = Email.new(email:"constructors@qwikstubs.owns", password:"thuglyfe", password_confirmation:"thuglyfe")
    @email.save!

    email = Email.find_by_email("constructors@qwikstubs.owns")
    email.should_not be_nil
    email.try(:authenticate, "thuglyfe")
    email.email.should == "constructors@qwikstubs.owns"
    email.password.should_not == "thuglyfe"
  end
end
