class PrdItemTag < ApplicationRecord

# creating many to many relationship with prd_tag table and prd_item table
# this is intermediate table
  belongs_to :prd_tag
  belongs_to :prd_item

end
