class LoginController < ApplicationController
  def index
    @email = Email.new
  end
end
