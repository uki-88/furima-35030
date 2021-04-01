FactoryBot.define do
  factory :purchase_address do
    post_code        { '123-4567' }
    shipping_area_id { 2 }
    municipality     { Faker::Address.city }
    address          { Faker::Address.street_address }
    building         { '忠生都営住宅' }
    telephone        { '00000000000' }
    token            { 'tok_abcdefghijk00000000000000000' }
  end
end
