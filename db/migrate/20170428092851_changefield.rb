class Changefield < ActiveRecord::Migration[5.0]
  def change
    remove_column :prd_items, :prd_type_id
    add_column :prd_items , :prd_type_id , :string
  end
end
