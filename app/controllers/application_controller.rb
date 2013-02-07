class ApplicationController < ActionController::Base
  before_filter :authorized?, :only => [:homepage]
  protect_from_forgery

  def signed_in?
    session[:user_id].present?
  end

  def authorized?
    redirect_to new_session_path unless signed_in?
  end

  def homepage
  end
end