require 'spec_helper'

describe VenuesController do
  render_views

  
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
  
#  it "should pass params to menu item" do
#    post 'create', :menu_item => { :name => 'Plain' }
#    assigns[:menu_item].name.should == 'Plain'
#  end

end
