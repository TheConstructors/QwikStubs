require 'spec_helper'
describe Email do
  it "should hash the password" do
    @email = Email.new(email:"constructors@qwikstubs.owns", password:"thuglyfe")
    @email.save.should == false
    @email = Email.new(email:"constructors@qwikstubs.owns", password:"thuglyfe", password_confirmation:"notthesame")
    @email.save.should == false
    @email = Email.new(email:"constructors@qwikstubs.owns", password:"thuglyfe", password_confirmation:"thuglyfe")
    @email.save!.should_not == false
    
    email = Email.find_by_email("constructors@qwikstubs.owns").try(:authenticate, "thuglyfe")
    email.email.should == "constructors@qwikstubs.owns"
    email.password.should_not == "thuglyfe"
    end
end
