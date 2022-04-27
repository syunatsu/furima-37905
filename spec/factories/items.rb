FactoryBot.define do
  factory :item do
    name            { Faker::Lorem.word }
    price           { Faker::Number.between(from: 300, to: 9_999_999) }
    description     { Faker::Lorem.sentence }
    condition_id    { Faker::Number.between(from: 2, to: 7) }
    category_id     { Faker::Number.between(from: 2, to: 11) }
    delivery_fee_id { Faker::Number.between(from: 2, to: 3) }
    prefecture_id   { Faker::Number.between(from: 2, to: 48) }
    shipment_day_id { Faker::Number.between(from: 2, to: 4) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample1.png'), filename: 'sample1.png')
    end
  end
end
