class CreatePrdSubCategoryTags < ActiveRecord::Migration[5.0]
  def change
    create_table :prd_sub_category_tags do |t|

      t.belongs_to :prd_sub_category, index: true
      t.belongs_to :prd_tag, index: true

      t.timestamps
    end
  end
end
