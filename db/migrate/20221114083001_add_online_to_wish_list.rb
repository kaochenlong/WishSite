class AddOnlineToWishList < ActiveRecord::Migration[6.1]
  def change
    add_column :wish_lists, :online, :boolean, default: false
  end
end
