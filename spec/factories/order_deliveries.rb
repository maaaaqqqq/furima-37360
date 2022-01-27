FactoryBot.define do
  factory :order_delivery do
    post_code      { '123-4567' }
    prefecture_id  { Faker::Number.between(from: 2, to: 48) }
    city           { Faker::Address.city }
    address        { Faker::Address.street_address }
    building_name  { Faker::Hobby.activity }
    tel            { '09022222222' }
    token          { 'tok_abcdefghijk00000000000000000' }
  end
end
