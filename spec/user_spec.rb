require 'spec_helper'
describe User do

  it "should not have errors when names are present" do
    @user = User.new(first:"Al", last:"Ham")
    @user.save
    @user.errors[:first].should be_empty
    @user.errors[:last].should be_empty
    end

  it "should have errors when names empty" do
    @user = User.create()
    @user.errors[:first].should_not be_empty
    @user.errors[:last].should_not be_empty
    end

end
