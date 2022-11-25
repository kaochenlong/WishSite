# frozen_string_literal: true

class CreateLikeWishLists < ActiveRecord::Migration[6.1]
  def change
    create_table :like_wish_lists do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :wish_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
