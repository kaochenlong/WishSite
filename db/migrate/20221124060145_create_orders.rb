# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :serial
      t.decimal :amount
      t.integer :quantity, default: 1
      t.string :state, default: 'pending'
      t.belongs_to :wish_list, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
