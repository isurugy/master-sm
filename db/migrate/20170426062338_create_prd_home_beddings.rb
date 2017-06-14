class CreatePrdHomeBeddings < ActiveRecord::Migration[5.0]
  def change
    create_table :prd_home_beddings do |t|
      t.string :material
      t.string :color
      t.string :size
      t.references :prd_sub_category, foreign_key: true
      t.references :prd_item, foreign_key: true

      t.timestamps
    end
  end
end
