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
      redirect_to '/users/new'
    end
  end

def show 
  @user= User.find(current_user.id)
end



def edit
    @user= User.find(current_user.id)
  end


def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to "/users/#{@user.id}"
    else
      render "/users/#{@user.id}/edit"
    end
  end

  def destroy
    @user = User.find(current_user.id)
    if @user.destroy
    redirect_to '/users/new'
    else 
      redirect_to '/users/@user.id'
    end
  end



private

def user_params
  params.require(:user).permit(:username, :password, :name, :catname, :location)
end



end