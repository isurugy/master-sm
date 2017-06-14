class CreatePrdItems < ActiveRecord::Migration[5.0]
  def change
    create_table :prd_items do |t|

      t.string :item_name
      t.string :brand
      t.string :item_no
      t.text :description
      t.money :price
      t.float :price_discount
      t.float :percentage_discount
      t.integer :stock_count
      t.string :availability

      t.references :usr_vendor_property, foreign_key: true

      t.timestamps
    end
  end
end
