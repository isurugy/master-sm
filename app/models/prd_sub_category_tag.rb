class PrdSubCategoryTag < ApplicationRecord

# creating many to many relationship with prd_tag table and prd_sub_category table
# this is intermediate table
  belongs_to :prd_tag
  belongs_to :prd_sub_category
  
end
