class CommentsController < ApplicationController
  def create
    @comment = Comment.create(text: comment_params[:text], entry_id: comment_params[:entry_id], user_id: current_user.id)
    redirect_to "/entry/#{comment_params[:entry_id]}"
  end

  private

  def comment_params
    params.permit(:text, :entry_id)
  end
end
