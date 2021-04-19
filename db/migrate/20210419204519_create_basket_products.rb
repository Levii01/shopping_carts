# frozen_string_literal: true

class CreateBasketProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :basket_products do |t|
      t.references :product, null: false, foreign_key: true
      t.references :basket, null: false, foreign_key: true
      t.decimal :price, precision: 13, scale: 2, null: false, default: 0
      t.decimal :promotional_price, precision: 13, scale: 2, null: false, default: 0

      t.timestamps
    end
  end
end
