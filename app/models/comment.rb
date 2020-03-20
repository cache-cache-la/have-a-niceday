class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :entry

  validates :text, presence: true, length: { maximum: 100 }
end
