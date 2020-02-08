class Tag < ApplicationRecord
  has_many :tag_maps, dependent: :destroy
  has_many :entries, through: :tag_maps

  validates :name, presence: true
end
