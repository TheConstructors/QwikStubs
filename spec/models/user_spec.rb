require 'spec_helper'

describe User do

  it "should have first, and last names given full_name" do
    @user = User.new(full_name: "Alex Hamstra")
    @user.first_name.should == "Alex"
    @user.last_name.should  == "Hamstra"
  end

  it "should have both hashed_pw, and salt after setting password" do
    @user = User.new()
    @user.password = "a_new_pass"
    @user.hashed_pw.should_not be_blank
    @user.salt.should_not be_blank
  end

  it "should have active_email after creating" do
    @user = User.new(full_name: "John Smith")
    @user.email    = "john@gmail.com"
    @user.active_email.should == "john@gmail.com"
  end

  it "should change both :hashed_pw, and :salt after setting password" do
    @user = User.new()
    @user.password = "a_new_pass"
    first_hash = @user.hashed_pw
    first_salt = @user.salt
    @user.password = "a_another_pass"
    second_hash = @user.hashed_pw
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
