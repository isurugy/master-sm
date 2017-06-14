class PrdAllIslandDelivery < ApplicationRecord

  # creating many to one relationship with prd_items table
  belongs_to :prd_item

end
