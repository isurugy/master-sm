class CreatePrdTypeItems < ActiveRecord::Migration[5.0]
  def change
    create_table :prd_type_items do |t|

      t.belongs_to :prd_item, index: true
      t.belongs_to :prd_type, index: true

      t.timestamps
    end
  end
end
