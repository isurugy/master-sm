class CreatePrdItemTags < ActiveRecord::Migration[5.0]
  def change
    create_table :prd_item_tags do |t|

      t.belongs_to :prd_item, index: true
      t.belongs_to :prd_tag, index: true

      t.timestamps
    end
  end
end
