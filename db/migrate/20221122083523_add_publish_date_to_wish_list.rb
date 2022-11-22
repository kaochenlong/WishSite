class AddPublishDateToWishList < ActiveRecord::Migration[6.1]
  def change
    add_column :wish_lists, :publish_date, :datetime
  end
end
