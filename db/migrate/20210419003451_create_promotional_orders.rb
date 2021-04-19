class CreatePromotionalOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :promotional_orders do |t|
      t.string :code
      t.integer :percentage
      t.decimal :activation_price, precision: 13, scale: 2, null: false, default: 0
      t.boolean :active

      t.timestamps
    end
  end
end
