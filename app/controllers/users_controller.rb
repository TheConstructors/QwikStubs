class UsersController < ApplicationController
  # Show User page
  def index
    redirect_to root_path
  end

  # Create new User (UI, registration)
  def new
    @user = User.new
  end

  # Create new User Logic
  def create
    @user = User.new
    user_email = params[:email]
    unless Email.find_by_email user_email
      if params[:password] == params[:password_conf]
        @user.password = params[:password]
        @user.save
        @email = Email.new email: user_email, user: @user
        @email.save
        # Now Logged In, send welcome email
        UserMailer.welcome_email(@user).deliver

        session[:user_id] = @user.id
        redirect_to root_path
      else
        flash.now[:error] = "Password's don't match."
        render :new; return
      end
    else
      flash.now[:error] = "Email already exists."
      render :new; return
    end
  end

  # Show specific User
  def show
  end

  # Edit a single User (UI)
  def edit
  end

  # Edit Logic
  def update
  end

  # Delete a User (probably not gonna be used)
  def destroy
  end
end
