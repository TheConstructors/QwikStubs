class UsersController < ApplicationController
  # Show User page
  def index
  end

  # Create new User (UI, registration)
  def new
    @user = User.new
  end

  # Create new User Logic
  def create
    pass = params[:password]
    @user = User.new(params[:user])
    @user.password = pass if pass == params[:password_conf]

    if @user.save
      redirect_to root_path
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
