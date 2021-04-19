# frozen_string_literal: true

class PromotionalOrder < ApplicationRecord
  scope :active, -> { where(active: true) }
end
