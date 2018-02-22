class BlogsController < ApplicationController

	def index
		@blogs = Blog.all
	end 

	def new
		@blog = Blog.new
	end

	def create
		@blog = Blog.new(blog_params)
		if @blog.save
			redirect_to '/blogs'
		else
			render '/blogs/new'
		end
	end


private

def blog_params
  params.require(:blog).permit(:title, :content)
end
end