class UsersController < ApplicationController
  before_action :set_tags

  def edit
    @entries = current_user.entries.page(params[:page]).per(3).order("created_at DESC")
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path, notice: "情報を更新しました"
    else
      render :edit, flash[:alert] = "更新に失敗しました"
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @entries = @user.entries.order("created_at DESC").page(params[:page]).per(9)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def set_tags
    @time = Tag.all.to_a.slice(0..4)
    @place = Tag.all.to_a.slice(5..8)
    @feeling = Tag.all.to_a.slice(9..13)
    @tag = Tag.find_by(id: params[:id])
  end
end
