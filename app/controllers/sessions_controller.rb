
class SessionsController < ApplicationController
  # Login View
  def new
      redirect_to root_path if signed_in?
  end

  # Login HTTP POST logic
  def create
    @email = Email.where(email: params[:email]).first
    @user  = (@email.present?) ? @email.user : nil
    authorized = @user.present? && @user.is_auth?(params[:password])

    if @email.present? && authorized
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.now[:error] = "Invalid email or password"
      render :new
    end
  end

  # Logout
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
