require 'spec_helper'

#there should be a lot more testing to see what the page is rendering
describe VenuesController do
  render_views

  describe "create method" do
    it "should create a new Venue" do
      post :create, FactoryGirl.build(:venue)
      response.should_not be_empty
    end
  end

  describe "new method" do
    it "should pass a new venue" do
      get :new
      assigns[:venue].should be_new_record
    end
  end
  
  describe "list method" do
    it "should pass a list of venue" do
      FactoryGirl.create(:venue)
      FactoryGirl.create(:venue)
      FactoryGirl.create(:venue)
      get :list
      response.body.should_not be_empty
    end
  end

  describe "show method" do
    it "should pass a new venue" do
      FactoryGirl.create(:venue, name: "Santa Barbara Bowl")
      get :show, name: "Santa Barbara Bowl"
      assigns[:venue].name.should == "Santa Barbara Bowl" 
    end
  end

  describe "edit method" do
    it "should " do
    end
  end

  describe "update method" do
    it "should " do
    end
  end

  describe "destroy method" do
    it "should " do
    end
  end

end
