class Entry < ApplicationRecord
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps
  has_many :comments
  belongs_to :user

  with_options presence: true do
    validates :title
    validates :text
  end

  mount_uploader :image, ImageUploader
end
