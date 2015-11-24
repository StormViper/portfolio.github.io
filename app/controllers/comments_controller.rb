class CommentsController < ApplicationController
	def create
		@comment = Comment.new(comment_params)
		@comment.article_id = current_article.id
		@comment.user_id = current_user.id
		if @comment.save
			flash[:success] = "Successfully created comment"
			redirect_to article_path(@comment.article)
		else
			debugger
			flash[:danger] = "Failed to create comment"
			redirect_to root_path
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:description)
	end
end