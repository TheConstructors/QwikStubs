require 'spec_helper'

describe Email do
  it "should allow find" do
    email = Email.find_by_email("constructors@qwikstubs.owns")
    email.should be_nil
  end
  
  it "should have a reference to user" do
    # fill in
    nil.should be_nil
  end
end
