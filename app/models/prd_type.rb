class PrdType < ApplicationRecord
  belongs_to :prd_sub_category
  has_many :prd_type_variations

  # creating many to many relationship with prd_types table
  has_many :prd_type_items
  has_many :prd_items, through: :prd_type_items

end
