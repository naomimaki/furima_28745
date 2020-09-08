FactoryBot.define do
  factory :item do
    image                     { Faker::Lorem.sentence }
    name                      { Faker::Lorem.sentence }
    info                      { Faker::Lorem.sentence }
    category_id               { Faker::Number.within(range: 1..10) }
    sales_status_id           { Faker::Number.within(range: 1..6) }
    shipping_fee_status_id    { Faker::Number.within(range: 1..2) }
    prefecture_id             { Faker::Number.within(range: 1..47) }
    schedule_delivery_id      { Faker::Number.within(range: 1..3) }
    price                     { Faker::Number.within(range: 300..9_999_999) }
    association :user
  end
end
