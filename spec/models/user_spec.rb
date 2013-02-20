require 'spec_helper'

describe User do

  it "should have first, and last names given full_name" do
    @user = User.new(full_name: "Alex Hamstra")
    @user.first_name.should == "Alex"
    @user.last_name.should  == "Hamstra"
  end

  it "should have both password_digest, and salt after setting password" do
    @user = User.new()
    @user.password = "a_new_pass"
    @user.password_digest.should_not be_blank
    @user.salt.should_not be_blank
  end

  it "should have the email in emails" do
    @user = User.new full_name: "John Smith", email: "john@gmail.com", :password => "dummy_pw"
    @user.emails.index("john@gmail.com").should_not be_nil
  end

  it "should have both different :password_digest, and :salt after setting password" do
    @user = User.new()
    @user.password = "a_new_pass"
    first_hash = @user.password_digest
    first_salt = @user.salt
    @user.password = "a_another_pass"
    second_hash = @user.password_digest
    second_salt = @user.salt
    first_hash.should_not == second_hash
    first_salt.should_not == first_hash
  end

  it "should return true, from it.is_auth?(pass) if the password is pass" do
    @user = User.new()
    @user.password = "new_pass"
    @user.is_auth?("new_pass").should == true
  end

end
