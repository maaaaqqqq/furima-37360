FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.last_name }
    email                 { Faker::Internet.free_email }
    password              { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    last_name             { '田中' }
    first_name            { '太郎' }
    last_name_katakana    { 'タナカ' }
    first_name_katakana   { 'タロウ' }
    birthday              { Faker::Date.backward }
  end
end
