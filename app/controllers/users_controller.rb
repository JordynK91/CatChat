class UsersController < ApplicationController

	def index
  end 

	def new
	@user = User.new
	end

	def create
	user = User.new(user_params)
    if user.save
      redirect_to "/"
    else 
      flash[:alert] = "Account Info Invalid. Please Try Again." 
    end
  end

def show 
  @current_user = User.find(session[:user_id])
  @user = User.find(params[:id])
  if @current_user == @user
    redirect_to "/users/#{@user.id}/edit"
    end
end



def edit
   @current_user = User.find(session[:user_id])
  @user= User.find(current_user.id)
  end


def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to "/users/#{@user.id}/edit"
    else
      render "/users/#{@user.id}/edit"
    end
  end

  def destroy
    @user = User.find(current_user.id)
    if @user.destroy
    redirect_to '/users/new'
    else 
      redirect_to "/users/#{@user.id}/edit"
    end
  end



private

def user_params
  params.require(:user).permit(:username, :password, :name, :catname, :location)
end

def blog_params
 params.require(:blog).permit(:title, :content, :user_id)
end

end