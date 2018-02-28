class CommentsController < ApplicationController

def index
	@comment = Comment.all
end

def new
	@comment= Comment.new
	@blog = Blog.find(params[:blog_id])
end


def create
		@comment = Comment.new(comment_params)
		@comment.user_id = current_user.id
		@blogid = params[:id]
		if @comment.save
			redirect_to "/blogs/"
		end
	end

def edit 
	@@this_comment = Comment.find_by_id(params[:id])
end


def update
	@this_comment = Comment.find_by_id(params[:id])
	@this_comment.update(comment_params)
	redirect_to "/blogs/"
	
	end

 def destroy
	 @comment = Comment.find(params[:id])
	 @comment.destroy
	 redirect_to "/blogs/"

	end



private

def comment_params
  params.require(:comment).permit(:message, :blog_id, :user_id)
end

end
