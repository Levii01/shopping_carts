# frozen_string_literal: true

class BasketProduct < ApplicationRecord
  belongs_to :product
  belongs_to :basket

  def final_price
    promotional_price.zero? ? price : promotional_price
  end
end
