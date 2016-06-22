class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @comment = current_user.comments.build(comment_params)
    @comment.casting = Casting.find(params[:id])
    @comment.save
    redirect_to casting_path(@comment.casting)
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end