# frozen_string_literal: true

class CreateBaskets < ActiveRecord::Migration[6.1]
  def change
    create_table :baskets do |t|
      t.jsonb :promotional_rules
      t.decimal :regular_price, precision: 13, scale: 2, null: false, default: 0
      t.decimal :final_price, precision: 13, scale: 2, null: false, default: 0

      t.timestamps
    end
  end
end
