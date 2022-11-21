class AddDeletedAtToWishlist < ActiveRecord::Migration[6.1]
  def change
    add_column :wish_lists, :deleted_at, :datetime
    add_index :wish_lists, :deleted_at
  end
end
