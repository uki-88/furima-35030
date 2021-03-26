class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :text
    validates :category_id
    validates :status_id
    validates :shipping_charge_id
    validates :shipping_area_id
    validates :days_to_ship_id
    validates :price,              format: { with: /\A[0-9]+\z/ }, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
    validates :image
  end


  belongs_to :user
  has_one_attached :image

end
