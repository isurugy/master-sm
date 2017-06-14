class CreatePrdItemVariationStores < ActiveRecord::Migration[5.0]
  def change
    create_table :prd_item_variation_stores do |t|
      t.references :prd_type_variation, foreign_key: true
      t.references :prd_item, foreign_key: true
      t.float :stock

      t.timestamps
    end
  end
end
