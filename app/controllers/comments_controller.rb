class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.listing_id = flash[:listing]
    if @comment.save
      redirect_to listing_path(@comment.listing)
    else
      flash[:notice] = "Invalid comment"
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :user_id, :listing_id)
  end
end
