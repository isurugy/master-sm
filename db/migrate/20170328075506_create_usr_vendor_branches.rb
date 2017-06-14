class CreateUsrVendorBranches < ActiveRecord::Migration[5.0]
  def change
    create_table :usr_vendor_branches do |t|
      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.integer :zip_code
      t.references :usr_vendor_property, foreign_key: true

      t.timestamps
    end
  end
end
