class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_code,:shipping_area_id, :municipality, :address, :building, :telephone, :user_id, :item_id, :token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipping_area_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :municipality
    validates :address
    validates :telephone, format: {with: /\A\d{11}\z/}
    validates :token
  end
  


  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, shipping_area_id: shipping_area_id, municipality: municipality, address: address, building: building, telephone: telephone, purchase_id: purchase.id)
  end
end