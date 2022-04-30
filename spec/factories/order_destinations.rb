FactoryBot.define do
  factory :order_destination do
    transient do
      gimei { Gimei.address }
    end

    postal_code   { '123-4567' }
    city          { gimei.city.kanji }
    address       { gimei.town.kanji }
    building_name { 'マンション大平101' }
    phone_number  { '09011111111' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    token         { 'sk_test_abcd00000000000000000000' }
  end
end
