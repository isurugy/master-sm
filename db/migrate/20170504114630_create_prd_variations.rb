class CreatePrdVariations < ActiveRecord::Migration[5.0]
  def change
    create_table :prd_variations do |t|
      t.string :value
      t.references :prd_variation_item, foreign_key: true

      t.timestamps
    end
  end
end
