class CreateUsrVendorProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :usr_vendor_properties do |t|
      t.string :specified_area
      t.string :mobile
      t.string :website
      t.string :shop_name

      t.timestamps
    end
  end
end
