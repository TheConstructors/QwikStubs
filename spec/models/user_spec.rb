require 'spec_helper'

describe User do

  describe "name" do

    it "should contain both a first and last name" do
      @user = FactoryGirl.build(:user, full_name: "Alex Hamstra")
      @user.first_name.should == "Alex"
      @user.last_name.should  == "Hamstra"
    end
  end

  context "with a password" do 
    before(:each) do
      @user = FactoryGirl.build(:user, password: "a_new_pass")
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
      @user = FactoryGirl.create(:user, full_name: "John Smith", :password => "dummy_pw")
      @email = FactoryGirl.create(:email, :email => "john@gmail.com", :user => @user)
      @user.emails.map { |e| e.email }.index("john@gmail.com").should_not be_nil
    end 

    #other email tests?
  end

  it "should be authorized with a password" do
    @user = FactoryGirl.build(:user, password: "new_pass")
    @user.is_auth?("new_pass").should == true
  end

  it "should send a welcome email properly" do
    @user = FactoryGirl.create(:user)
    @email = FactoryGirl.create(:email, :email => "john@gmail.com", :user => @user)
    @user.send_welcome
    UserMailer.deliveries.last.to.should == [@user.get_email]
  end

end
