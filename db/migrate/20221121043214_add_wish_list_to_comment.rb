# frozen_string_literal: true

class AddWishListToComment < ActiveRecord::Migration[6.1]
  def change
    add_belongs_to :comments, :wish_list
  end
end
