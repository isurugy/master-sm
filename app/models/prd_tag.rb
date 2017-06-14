class PrdTag < ApplicationRecord

  # creating many to many relationship with prd_items table
  has_many :prd_item_tags
  has_many :prd_items, through: :prd_item_tags

  # creating many to many relationship with prd_sub_categories table
  has_many :prd_sub_category_tags
  has_many :prd_sub_categories, through: :prd_sub_category_tags

end
