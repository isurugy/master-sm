class CreatePrdItemImages < ActiveRecord::Migration[5.0]
  def change
    create_table :prd_item_images do |t|

      t.string :image
      t.string :description

      t.references :prd_item, foreign_key: true

      t.timestamps
    end
  end
end
