# frozen_string_literal: true

class CreatePromotionalItems < ActiveRecord::Migration[6.1]
  def change
    create_table :promotional_items do |t|
      t.string :code
      t.references :product, null: false, foreign_key: true
      t.decimal :price, precision: 13, scale: 2, null: false, default: 0
      t.integer :activation_amount
      t.boolean :active

      t.timestamps
    end
  end
end
