class TagsController < ApplicationController
  before_action :set_tags

  def show
    @entries = @tag.entries.order("created_at DESC").page(params[:page]).per(9)
    @tag_count = @tag.entries.count
  end

  private
  def set_tags
    @time = Tag.all.to_a.slice(0..4)
    @place = Tag.all.to_a.slice(5..8)
    @feeling = Tag.all.to_a.slice(9..13)
    @tag = Tag.find_by(id: params[:id])
  end

end