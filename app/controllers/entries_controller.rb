class EntriesController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_entry, only: [:edit, :show]

  def index
    @entries = Entry.all.includes(:user).order("created_at DESC").page(params[:page]).per(9)
    # @tag = Tag.find_by(id: params[:id])
    # @entries = @tag.entries
  end

  def new
    @entry = Entry.new
  end

  def create
    Entry.create(entry_params)
  end

  def edit
  end

  def update
    entry = Entry.find(params[:id])
    entry.update(entry_params) if entry.user_id == current_user.id
  end

  def show
    @comments = @entry.comments.includes(:user)
  end

  def destroy
    entry = Entry.find(params[:id])
    entry.destroy  if entry.user_id == current_user.id
  end

  private
  def entry_params
    params.require(:entry).permit(:url, :image, :text, :title, tag_ids: []).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def set_entry
    @entry = Entry.find(params[:id])
  end
end
