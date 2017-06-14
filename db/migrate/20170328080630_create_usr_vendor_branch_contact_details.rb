class CreateUsrVendorBranchContactDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :usr_vendor_branch_contact_details do |t|
      t.string :contact_method
      t.string :value
      t.references :usr_vendor_branch, foreign_key: true

      t.timestamps
    end
  end
end
