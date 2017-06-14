class PrdItemVariationStore < ApplicationRecord
  belongs_to :prd_type_variation
  belongs_to :prd_item
end
