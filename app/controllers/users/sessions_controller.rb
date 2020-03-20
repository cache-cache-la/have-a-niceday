# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :set_tags
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  def set_tags
    @tags = Tag.all
    @time = Tag.all.to_a.slice(0..4)
    @place = Tag.all.to_a.slice(5..8)
    @feeling = Tag.all.to_a.slice(9..13)
    @tag = Tag.find_by(id: params[:id])
  end
end
