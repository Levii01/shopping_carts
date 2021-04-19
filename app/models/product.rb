# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :promotional_items, dependent: :destroy
end
