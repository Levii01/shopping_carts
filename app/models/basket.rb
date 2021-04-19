# frozen_string_literal: true

class Basket < ApplicationRecord
  has_many :basket_products
  has_many :products, through: :basket_products

  def sum_final_prices
    basket_products.map(&:final_price).inject(:+)
  end

  def price_with_currency
    ActiveSupport::NumberHelper.number_to_currency(final_price, precision: 2, unit: "£")
  end
end
