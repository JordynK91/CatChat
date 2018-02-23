class BlogsController < ApplicationController

	def index
		@blogs = Blog.all
	end 

	def new
		@blog = Blog.new
	end

	def create
<<<<<<< HEAD
		@blog = Blog.new(blog_params)
=======
		
		@blog = Blog.new(blog_params)
		@blog.user_id = current_user.id
>>>>>>> 90408a3d19becbf2f3865f5eb81f33d226b715f1
		if @blog.save
			redirect_to '/blogs'
		else
			render '/blogs/new'
		end
	end

<<<<<<< HEAD
=======
	def show
		@blog = Blog.find_by_id(params[:id])
	end

	def edit
		@blog = Blog.find_by_id(params[:id])
	end

	def update
		@blog = Blog.find(params[:id])
		if @blog.update(blog_params)
			redirect_to "/blogs/#{@blog.id}"
		else
			render "/blogs/#{@blog.id}/edit"
		end
	end

	def destroy
		@blog = Blog.find(params[:id])
		@blog.destroy
		redirect_to new_blog_path
	end

>>>>>>> 90408a3d19becbf2f3865f5eb81f33d226b715f1

private

def blog_params
<<<<<<< HEAD
  params.require(:blog).permit(:title, :content)
=======
  params.require(:blog).permit(:title, :content, :user_id)
>>>>>>> 90408a3d19becbf2f3865f5eb81f33d226b715f1
end
end