class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to entry_path(@comment.entry), notice: "コメントを送信しました"
    else
      redirect_to entry_path(@comment.entry), alert: "コメントが入力できませんでした"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, entry_id: params[:entry_id])
  end
end
