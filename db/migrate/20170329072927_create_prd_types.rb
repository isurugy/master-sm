class CreatePrdTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :prd_types do |t|
      t.references :prd_sub_category, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
