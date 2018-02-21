class UsersController < ApplicationController

	def index
	end 

	def new
	@user = User.new
	end

	def create
	user = User.new(user_params)
    if user.save
      redirect_to '/'
    else
      redirect_to '/'
    end
  end


 
def create_session
    @user = User.find_by_username(params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id 
      flash[:message] = 'you logged in successfully'
      redirect_to '/'
    else 
      flash[:message] = 'try again'
      redirect_to '/'
    end
  end


  def destroy_session
    session[:user_id] = nil
    flash[:message] = 'logging out ok'
    redirect_to '/login'
  end





private

def user_params
  params.require(:user).permit(:username, :password, :name, :catname, :location)
end



end