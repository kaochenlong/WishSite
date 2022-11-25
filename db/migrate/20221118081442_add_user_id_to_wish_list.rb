# frozen_string_literal: true

class AddUserIdToWishList < ActiveRecord::Migration[6.1]
  def change
    # add_column :wish_lists, :user_id, :integer
    # add_index :wish_lists, :user_id

    add_belongs_to :wish_lists, :user
    # add_reference :wish_lists, :user
  end
end
