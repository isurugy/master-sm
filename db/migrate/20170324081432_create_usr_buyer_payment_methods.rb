class CreateUsrBuyerPaymentMethods < ActiveRecord::Migration[5.0]
  def change
    create_table :usr_buyer_payment_methods do |t|
      t.string :card_name
      t.string :encrypted_card_number
      t.string :encrypted_cvv
      t.string :encrypted_expiry_date
      t.references :usr_contact, foreign_key: true

      t.timestamps
    end
  end
end
