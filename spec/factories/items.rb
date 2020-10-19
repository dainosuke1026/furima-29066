FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence }
    price { Faker::Commerce.price(range: 300..9_999_999) }

    category_id { 2 }
    status_id { 2 }
    cost_id { 2 }
    prefecture_id { 2 }
    day_id { 2 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg')
    end
  end
end
