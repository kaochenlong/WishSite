# frozen_string_literal: true

class LikeWishList < ApplicationRecord
  belongs_to :user
  belongs_to :wish_list
end
