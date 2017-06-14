class CreateUsrBuyerDeliveryAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :usr_buyer_delivery_addresses do |t|
      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.integer :zip_code
      t.string :country
      t.references :usr_contact, foreign_key: true

      t.timestamps
    end
  end
end
