# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    sequence(:code) { |n| "0" * (3 - n.to_s.size) << n.to_s }
    name { "Blue Scarf" }
    price { 15.25 }

    trait :scarf do
      code { "001" }
      name { "Red Scarf" }
      price { 9.25 }
    end

    trait :cufflinks do
      code { "002" }
      name { "Silver cufflinks" }
      price { 45.00 }
    end

    trait :dress do
      code { "003" }
      name { "Silk Dress" }
      price { 19.95 }
    end
  end

  factory :promotional_item do
    code { "red1" }
    product
    price { 8.50 }
    activation_amount { 2 }
    active { true }
  end

  factory :promotional_order do
    sequence(:code) { |n| "start#{n}" }
    percentage { 10 }
    activation_price { 60 }
    active { true }
  end
end
