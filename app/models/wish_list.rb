class WishList < ApplicationRecord
  # validations
  validates :title, presence: true
  validates :description, presence: true

  # relationships
  belongs_to :user
end
