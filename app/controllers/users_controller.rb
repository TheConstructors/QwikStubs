class UsersController < ApplicationController
  # Show User page
  def index
  end

  # Create new User (UI, registration)
  def new
  end

  # Create new User Logic
  def create
    debugger
    name = params[:full_name]
    email = params[:email]
    passw = params[:password]
    passw_conf = params[:password_conf]
    @user = User.new full_name: name, email: email
    if passw == passw_conf
      @user.password = passw
      if @user.save
        redirect_to root_path
      else
        #validation failure
        puts "Failed to save User"
      end
    else
      flash[:pass_match] = false
      redirect_to new_user_path
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
