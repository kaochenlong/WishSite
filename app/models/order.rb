class Order < ApplicationRecord
  belongs_to :wish_list
  belongs_to :user

  validates :serial, presence: true
end
