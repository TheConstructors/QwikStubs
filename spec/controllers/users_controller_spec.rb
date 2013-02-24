require 'spec_helper'

describe UsersController do
  render_views
  fixtures :all
  
  it "should redirect to root with a notice on successful save" do
    User.any_instance.stubs(:valid?).returns(true)
    post 'create'
    assigns[:user].should_not be_new_record
    flash[:notice].should be_nil
    response.should redirect_to('index')
  end

  it "should re-render new template on failed save" do
    User.any_instance.stubs(:valid?).returns(false)
    post 'create'
    assigns[:user].should be_new_record
    flash[:error].should_not be_nil
    response.should render_template('new')
  end
  
#  it "should pass params to menu item" do
#    post 'create', :menu_item => { :name => 'Plain' }
#    assigns[:menu_item].name.should == 'Plain'
#  end
  

end
