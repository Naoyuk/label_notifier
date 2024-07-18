# frozen_string_literal: true

FactoryBot.define do
  factory :interval do
    day { 1 }
    copies_per_day { 1 }
  end
end
