class CreatePrdHomeBaths < ActiveRecord::Migration[5.0]
  def change
    create_table :prd_home_baths do |t|
      t.string :material
      t.string :color
      t.references :prd_sub_category, foreign_key: true
      t.references :prd_item, foreign_key: true

      t.timestamps
    end
  end
end
