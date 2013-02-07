class SessionsController < ApplicationController
  # Login View
  def new
      redirect_to root_path if signed_in? 
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
        session[:user_id] = @user.id
        redirect_to root_path
      end
    end
  end
  
  # Logout 
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
