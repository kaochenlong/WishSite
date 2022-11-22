class LikeWishList < ApplicationRecord
  belongs_to :user
  belongs_to :wish_list
end
