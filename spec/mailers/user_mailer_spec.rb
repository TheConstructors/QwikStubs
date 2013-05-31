require "spec_helper"

describe UserMailer do
  describe "welcome" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      @email = FactoryGirl.create(:email, :user=>@user)
      @mail = UserMailer.welcome_email(@user)
    end

    it "should render the correct subject" do
      @mail.subject.should == "Welcome to Qwikstubs!"
    end

    it "should render the correct receiver email" do 
      @mail.to.should == [@user.get_email]
    end

    it "should render the correct sender email" do
      @mail.from.should == ['do_not_reply@qwikstubs.com']
    end

    it "should assign the correct @full_name" do
      @mail.body.encoded.should match(@user.full_name)
    end

    it "should assign the correct login url" do 
      @mail.body.encoded.should match("www.qwikstubs.com/login")
    end

  end
end
