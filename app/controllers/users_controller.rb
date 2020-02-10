class UsersController < ApplicationController

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    user = User.find(params[:id])
    @name = current_user&.name
    @entries = user.entries.order("created_at DESC").page(params[:page]).per(3)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
