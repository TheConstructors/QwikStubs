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
    # This NEEDS clean up, pushing for Alex right now, comp gonna die.
    pass = params[:password]
    email = params[:user][:email]
    params[:user][:email] = nil #remove email, was causing a bug needs to be fixed
    @user = User.new params[:user]
    # check save here
    @email = Email.new email: email, user: @user
    @email.save
    @user.password = pass if pass == params[:password_conf]

    if @user.save
      render :index
    else
      # TODO: could probably change the flash display to enumerate @user.errors
      flash.now[:error] = "Something went wrong - please check your fields and try again!"
      render :new
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
