class PrdHomeTool < ApplicationRecord
  belongs_to :prd_sub_category
  belongs_to :prd_item
end
