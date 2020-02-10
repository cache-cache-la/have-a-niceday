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

  VALID_URL_REGEX = /\A#{URI::regexp(%w(http https))}\z/
  validates :url, allow_blank: true, format: { with: VALID_URL_REGEX }

end
