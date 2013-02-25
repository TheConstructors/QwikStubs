require 'spec_helper'

describe User do

  describe "name" do

    it "should contain both a first and last name" do
      @user = User.new(full_name: "Alex Hamstra")
      @user.first_name.should == "Alex"
      @user.last_name.should  == "Hamstra"
    end
  end

  context "with a password" do 
    before(:each) do
      @user = User.new()
      @user.password = "a_new_pass"
    end

    it "should have both password_digest and salt" do
      @user.password_digest.should_not be_blank
      @user.salt.should_not be_blank
    end

    it "should have a unique password_digest and salt" do
      first_hash = @user.password_digest
      first_salt = @user.salt
      @user.password = "a_another_pass"
      second_hash = @user.password_digest
      second_salt = @user.salt
      first_hash.should_not == second_hash
      first_salt.should_not == first_hash
    end
  end 

  describe "email" do
    it "should be in 'emails'" do
      @user = User.create! full_name: "John Smith", :password => "dummy_pw"
      @email = Email.create! :email => "john@gmail.com", :user => @user
      @user.emails.map { |e| e.email }.index("john@gmail.com").should_not be_nil
    end 

    #other email tests?
  end

  it "should be authorized with a password" do
    @user = User.new()
    @user.password = "new_pass"
    @user.is_auth?("new_pass").should == true
  end

end
