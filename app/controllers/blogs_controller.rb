class BlogsController < ApplicationController

	def index
		@blogs = Blog.all
		@current_user = User.find(session[:user_id])
	end 

	def new
		@blog = Blog.new
		@current_user = User.find(session[:user_id])
	end

	def create
		@blog = Blog.new(blog_params)
		@blog.user_id = current_user.id
		@current_user = User.find(session[:user_id])
		if @blog.save
			redirect_to "/blogs/#{@blog.id}"
		else
			render '/blogs/new'
		end
	end


	def show
		@blog = Blog.find_by_id(params[:id])
		@blogid = @blog.id
		@user = User.find_by_id(@blog.user_id)
		@current_comment = Comment.where(blog_id: @blog.id)
		@comment = Comment.new(comment_params)
		@this_comment = Comment.find_by_id(params[:id])
		@current_user = User.find(session[:user_id])
 		@user_comment = User.find_by_id(@comment)
	end

	def edit
		@blog = Blog.find_by_id(params[:id])
		@current_user = User.find(session[:user_id])
	end

	def update
		@blog = Blog.find(params[:id])
		@current_user = User.find(session[:user_id])
		if @blog.update(blog_params)
			redirect_to "/blogs/#{@blog.id}"
		else
			render "/blogs/#{@blog.id}/edit"
		end
	end

	def destroy
		@blog = Blog.find(params[:id])
		@current_user = User.find(session[:user_id])
		@blog.destroy
		redirect_to new_blog_path
	end


private

def blog_params
  
  params.require(:blog).permit(:title, :content, :user_id)
end

def comment_params
 params.permit(:message, :blog_id, :user_id)	

end

end