class AddPromotions < ActiveRecord::Migration[6.1]
  def up
    PromotionalItem.create!(code: "red1", product: Product.find_by_name("Red Scarf"), price: 8.50, activation_amount: 2, active: true)
    PromotionalOrder.create!(code: "start10", percentage: 10, activation_price: 60, active: true)
  end

  def down
    PromotionalItem.find_by(code: "red1")&.destroy
    PromotionalOrder.find_by(code: "start10")&.destroy
  end
end
