class Like < ApplicationRecord
  belongs_to :user

  validates :comic_id, presence: true
end
