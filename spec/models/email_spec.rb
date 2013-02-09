require 'spec_helper'

describe Email do
  it "should allow find" do
    email = Email.find_by_email("constructors@qwikstubs.owns")
    email.should be_nil
  end

  it "should hash the password" do
    User.count.should == 0
    Email.count.should == 0
    user = User.create!(full_name: "John Doe", password: 'secretpw')
    email = Email.new(user: user, email:"constructors@qwikstubs.owns", password:"thuglyfe")
    email.valid?.should == false
    email = Email.new(user: user, email:"constructors@qwikstubs.owns", password:"thuglyfe", password_confirmation:"notthesame")
    email.valid?.should == false
    email = Email.new(email:"constructors@qwikstubs.owns", password:"thuglyfe", password_confirmation:"thuglyfe")
    email.user = user
    email.user.should == user
    email.save!

    email = Email.find_by_email("constructors@qwikstubs.owns")
    email.should_not be_nil
    email.try(:authenticate, "thuglyfe")
    email.email.should == "constructors@qwikstubs.owns"
    email.password.should_not == "thuglyfe"
  end
end
