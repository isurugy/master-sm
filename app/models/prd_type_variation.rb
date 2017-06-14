class PrdTypeVariation < ApplicationRecord
  belongs_to :prd_variation_item
  belongs_to :prd_variation
  belongs_to :prd_type
  has_many :prd_item_variation_stores
end
