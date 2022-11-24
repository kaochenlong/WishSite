class AddAmountToWishList < ActiveRecord::Migration[6.1]
  def change
    add_column :wish_lists, :amount, :integer, default: 0
  end
end
