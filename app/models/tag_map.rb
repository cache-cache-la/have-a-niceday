class TagMap < ApplicationRecord
  belongs_to :entry
  belongs_to :tag
end
