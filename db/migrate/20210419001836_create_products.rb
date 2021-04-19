class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :code, null: false
      t.string :name, null: false
      t.decimal :amount, precision: 13, scale: 2, null: false, default: 0

      t.timestamps
    end
  end
end
