# frozen_string_literal: true

class CheckoutService
  attr_accessor :promotional_rules, :basket

  def initialize(promotional_rules = nil)
    @promotional_rules = promotional_rules
    @basket = Basket.create!(promotional_rules: promotional_rules)
  end

  def scan(product_code)
    product = Product.find_by_code!(product_code)
    basket_products.create!(product: product, price: product.price)
  end

  def total
    if @promotional_rules
      count_products_promotions
      count_basket_promotions
    else
      count_basket_regular_price
    end

    # TODO: Add payment method
    @basket.price_with_currency
  end

  private

  def count_products_promotions
    @promotional_rules[:products].each do |promo|
      products = basket_products.where(product: promo.product)
      products.update(promotional_price: promo.price) if products.count >= promo.activation_amount
    end
    count_basket_regular_price
  end

  def count_basket_promotions
    @promotional_rules[:basket].each do |promo|
      @basket.update!(final_price: percentage_discount(promo.percentage)) if @basket.final_price > promo.activation_price
    end
  end

  def count_basket_regular_price
    regular_price = @basket.sum_final_prices
    @basket.update!(regular_price: regular_price, final_price: regular_price)
  end

  def percentage_discount(percentage)
    @basket.final_price * (100 - percentage) / 100.0
  end

  def basket_products
    @basket_products ||= @basket.basket_products
  end
end
