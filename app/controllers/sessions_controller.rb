class SessionsController < ApplicationController

def create
	@user = User.find_by_username(params[:username])
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id 
			redirect_to "/users/#{@user.id}/edit"
		else 
			
			redirect_to "/"
			flash[:alert] = "Account Info Invalid. Please Try Again." 
	end
end

	def destroy
		session[:user_id] = nil
		redirect_to '/'
	end


end
