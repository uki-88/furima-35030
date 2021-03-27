FactoryBot.define do
  factory :item do
    name                {Faker::Team.name}
    text                {Faker::Lorem.sentence}
    category_id         {2}
    status_id           {2}
    shipping_area_id    {2}
    shipping_charge_id  {2}
    days_to_ship_id     {2}
    price               {1000}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/testimage.png'), filename: 'testimage.png')
    end
  end
end
