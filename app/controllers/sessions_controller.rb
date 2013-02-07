class SessionsController < ApplicationController
  # Login View
  def new
    #if signed_in? redirect_to home_page
  end
  
  # Login HTTP POST logic 
  def create
    email = params[:email]
    password = params[:password]
    @user = User.find_by_active_email(email)
    if @user.nil?
      flash[:invalid_creds] = true
      redirect_to new_session_path
    else 
      if @user.is_auth?(password)
        redirect_to sessions_path
      end
    end
  end
  
  # Logout 
  def destroy
    session[:user_id] = nil
  end
end
