class SessionsController < ApplicationController

def create
	@user = User.find_by_username(params[:username])
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id 
			flash[:message] = 'you logged in successfully'
			redirect_to "/users/#{@user.id}"
		else 
			flash[:message] = 'try again'
			redirect_to '/users/new'
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to '/'
	end


end
