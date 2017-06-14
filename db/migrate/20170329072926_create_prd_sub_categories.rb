class CreatePrdSubCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :prd_sub_categories do |t|
      t.string :name
      t.string :icon
      t.references :prd_categories, foreign_key: true

      t.timestamps
    end
  end
end
