class ApplicationController < ActionController::Base
  before_filter :signed_in?, :only => [:homepage]
  protect_from_forgery

  def signed_in?
    session[:user_id].present?
  end

  def homepage
  end
end