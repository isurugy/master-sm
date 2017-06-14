class PrdSubCategory < ApplicationRecord
  belongs_to :prd_categories

  # creating many to many relationship with prd_tags table
  has_many :prd_sub_category_tags
  has_many :prd_tags, through: :prd_sub_category_tags
end
