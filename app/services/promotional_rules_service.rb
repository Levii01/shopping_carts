# frozen_string_literal: true

class PromotionalRulesService
  def self.call
    new.call
  end

  def call
    { products: current_promotional_items, basket: current_promotional_baskets }
  end

  private

  def current_promotional_items
    PromotionalItem.active
  end

  def current_promotional_baskets
    PromotionalOrder.active
  end
end
