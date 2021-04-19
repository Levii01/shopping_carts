# frozen_string_literal: true

class PromotionalItem < ApplicationRecord
  scope :active, -> { where(active: true) }

  belongs_to :product
end
