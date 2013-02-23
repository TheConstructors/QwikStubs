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
    new_email = params[:email]
    @user = User.new
    @email = Email.new(email: new_email, user: @user)
    if @email.save
      @email.errors.messages.each do |ek, ev|
        flash.now[ek] = ev
      end
      render :new
    end
    
    @user.password = params[:password] if params[:password] == params[:password_conf]

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
