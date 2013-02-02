require 'spec_helper'
describe Email do
  it "should save email" do
    @email = Email.new(email:"constructors@qwikstubs.owns", password:"thuglyfe",
                      oath_key:"1234tqgfqreb",salt:"shaker")
    @email.email.should == "constructors@qwikstubs.owns"
    end
end
