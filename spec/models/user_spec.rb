require 'spec_helper'

describe User do
  it "should have first, and last names given full_name" do
    @user = User.new(full_name: "Alex Hamstra")
    @user.first.should == "Alex"
    @user.last.should == "Hamstra"
  end
  
  it "should have both hashed_pw, and salt after setting password" do
    @user = User.new()
    @user.password = "a_new_pass"
    @user.hashed_pw.should != nil
    @user.salt.should != nil
  end
  
  it "should change both :hashed_pw, and :salt after setting password" do
    @user = User.new()
    @user.password = "a_new_pass"
    first_hash = @user.hashed_pw 
    first_salt = @user.salt
    @user.password = "a_another_pass"
    second_hash = @user.hashed_pw
    second_salt = @user.salt
    first_hash.should != second_hash
    first_salt.should != first_hash
  end
end