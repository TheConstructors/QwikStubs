class RegisterController < ApplicationController
  def index
    @email = Email.new
  end

  def create
    @email = Email.new(params[:email])
    @email.save! 
  end
end
