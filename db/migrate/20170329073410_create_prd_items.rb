class CreatePrdItems < ActiveRecord::Migration[5.0]
  def change
    create_table :prd_items do |t|

      t.string :item_name
      t.string :brand
      t.string :item_no
      t.text :short_description
      t.text :long_description
      t.money :price
      t.money :base_price
      t.float :price_discount
      t.float :percentage_discount
      t.integer :stock_count
      t.string :availability
      t.money :base_price
      t.references :usr_vendor_property, foreign_key: true
      t.references :prd_type, foreign_key: true

      t.timestamps
    end
  end
end
