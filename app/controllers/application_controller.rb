class ApplicationController < ActionController::Base
  protect_from_forgery
  def signed_in?
  	session[:user_id].present?
  end
end