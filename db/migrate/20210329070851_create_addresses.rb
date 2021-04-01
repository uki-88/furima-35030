class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :post_code,         null: false
      t.integer    :shipping_area_id,  null: false
      t.string     :municipality,      null: false
      t.string     :address,            null: false
      t.string     :building
      t.string     :telephone,         null: false
      t.references :purchase,          null: false, foreign_key: true

      t.timestamps
    end
  end
end
