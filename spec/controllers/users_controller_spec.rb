require 'spec_helper'

describe UsersController do
  render_views

  describe "create method" do
    it "should redirect to root with a notice on successful save" do
      User.any_instance.stubs(:valid?).returns(true)
      post :create, user: FactoryGirl.attributes_for(:user, email:"alex@qwikstubs.com")
      flash[:error].should be_nil
      response.should redirect_to root_path
    end
    
    it "should re-render new template on failed save" do
      User.any_instance.stubs(:valid?).returns(false)
      post :create, user: FactoryGirl.attributes_for(:user, email:"alex@qwikstubs.com")
      #flash[:error].should_not be_nil #Something wrong with this test
      response.should render_template('new')
    end
  end

  describe "new method" do
    it "should pass a new user" do
      get :new
      assigns[:user].should be_new_record
    end
  end
  
  describe "index method" do
    it "should redirect to root_path" do
      post :index
      response.should redirect_to root_path
    end
  end

  describe "show method" do
    it "should pass a new user" do
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
