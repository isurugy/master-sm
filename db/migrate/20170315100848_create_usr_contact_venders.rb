class CreateUsrContactVenders < ActiveRecord::Migration[5.0]
  def change
    create_table :usr_contact_vendors do |t|
      t.references :usr_contact, foreign_key: true
      t.references :usr_vendor_property, foreign_key: true

      t.timestamps
    end
  end
end
