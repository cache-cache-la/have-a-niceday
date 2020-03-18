class EntriesController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :search]
  before_action :set_entry, only: [:edit, :update, :show, :destroy]
  before_action :set_tags

  def index
    @entries = Entry.all.includes(:user).order("created_at DESC").page(params[:page]).per(9)
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      redirect_to root_path, notice: "投稿しました"
    else
      redirect_to new_entry_path, alert: "必須項目を入力してください"
    end
  end

  def edit
  end

  def update
    @entry.update(entry_params) if @entry.user_id == current_user.id
    if @entry.update(entry_params)
      redirect_to entry_path, notice: "投稿を更新しました"
    else
      redirect_to edit_entry_path, alert: "必須項目を入力してください"
    end
  end

  def show
    @comment = Comment.new
    @comments = @entry.comments.includes(:user)
  end

  def search
    @entries = Entry.search(params[:keyword]).order("created_at DESC").page(params[:page]).per(9)
    @keyword_count = @entries.count
    respond_to do |format|
      format.html
      format.json
    end
  end

  def destroy
    @entry.destroy  if @entry.user_id == current_user.id
    if @entry.destroy
      redirect_to root_path, notice: "削除しました"
    else
      render :show, flash[:alert] = "削除に失敗しました"
    end
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

  def set_tags
    @time = Tag.all.to_a.slice(0..4)
    @place = Tag.all.to_a.slice(5..8)
    @feeling = Tag.all.to_a.slice(9..13)
    @tag = Tag.find_by(id: params[:id])
  end
end
