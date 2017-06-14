class CreatePrdTypeVariations < ActiveRecord::Migration[5.0]
  def change
    create_table :prd_type_variations do |t|
      t.references :prd_variation_item, foreign_key: true
      t.references :prd_variation, foreign_key: true
      t.references :prd_type, foreign_key: true

      t.timestamps
    end
  end
end
