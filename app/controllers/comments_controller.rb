class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @comment = current_user.comments.new params[:comment]
    @comment.commentable = Link.find(params[:link_id])
    if @comment.save
      redirect_to @comment.commentable, notice: "Yay"
    else
      redirect_to @comment.commentable, alert: "Ah shit"
    end
  end
end
