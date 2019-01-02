class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
    redirect_to listing_path(@comment.listing)
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :user_id, :listing_id)
  end
end
