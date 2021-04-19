# frozen_string_literal: true

class AddProducts < ActiveRecord::Migration[6.1]
  def up
    Product.create!(code: "001", name: "Red Scarf", price: 9.25)
    Product.create!(code: "002", name: "Silver cufflinks", price: 45.00)
    Product.create!(code: "003", name: "Silk Dress", price: 19.95)
  end

  def down
    Product.where(code: %w[001 002 003]).destroy_all
  end
end
