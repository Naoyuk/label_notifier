FactoryBot.define do
  factory :print do
    print_on { "2024-07-16" }
    copies { 1 }
    association :label
  end
end
