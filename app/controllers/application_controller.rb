class ApplicationController < ActionController::Base
  before_filter :signed_in?, :only => [:homepage]
  protect_from_forgery
  
  helper_method :signed_in?, :current_user

  def signed_in?
    session[:user_id].present?
  end

  def current_user
    User.find(session[:user_id])
  end

  def homepage
    @user = current_user
  end
end
