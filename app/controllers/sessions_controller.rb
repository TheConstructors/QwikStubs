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
		if @user.is_auth? password 
			session[:user_id] = @user.id
		else
			#redirect_to somewhere
		end
	end
	
	# Logout 
	def destroy
		session[:user_id] = nil
	end
end
