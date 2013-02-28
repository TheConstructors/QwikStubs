require 'spec_helper'

describe VenuesController do
  render_views

  describe "create method" do
    it "should redirect to root with a notice on successful save" do
      Venue.any_instance.stubs(:valid?).returns(true)
      post 'create'
      flash[:error].should be_nil
      response.should redirect_to('/venue')
    end
    
    it "should re-render new template on failed save" do
      Venue.any_instance.stubs(:valid?).returns(false)
      post 'create'
      flash[:error].should_not be_nil
      response.should render_template('new')
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
      assigns(:venues).length.should == Venue.all.length
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
