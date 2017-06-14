class PrdItem < ApplicationRecord

  # creating many to one relationship with usr_vender_property table
  belongs_to :usr_vendor_property


  #item-variations
  has_many :prd_type_variation

  #creating relationships for storing variations table
  has_many :prd_item_variation_stores

  #creating relationships for subcategories

    #home category
  has_many :prd_home_baths
  accepts_nested_attributes_for :prd_home_baths, allow_destroy: true

  has_many :prd_home_furnitures
  accepts_nested_attributes_for :prd_home_furnitures, allow_destroy: true

  has_many :prd_home_beddings
  accepts_nested_attributes_for :prd_home_beddings, allow_destroy: true

  has_many :prd_home_gardens
  accepts_nested_attributes_for :prd_home_gardens, allow_destroy: true

  has_many :prd_home_hh_supply_cleans
  accepts_nested_attributes_for :prd_home_hh_supply_cleans, allow_destroy: true

  has_many :prd_home_home_appliances
  accepts_nested_attributes_for :prd_home_home_appliances, allow_destroy: true

  has_many :prd_home_home_decors
  accepts_nested_attributes_for :prd_home_home_decors, allow_destroy: true

  has_many :prd_home_home_improvements
  accepts_nested_attributes_for :prd_home_home_improvements, allow_destroy: true

  has_many :prd_home_kitchen_appliances
  accepts_nested_attributes_for :prd_home_kitchen_appliances, allow_destroy: true

  has_many :prd_home_kitchen_dining_bars
  accepts_nested_attributes_for :prd_home_kitchen_dining_bars, allow_destroy: true

  has_many :prd_home_lamps_lightings
  accepts_nested_attributes_for :prd_home_lamps_lightings, allow_destroy: true

  has_many :prd_home_pet_supplies
  accepts_nested_attributes_for :prd_home_pet_supplies, allow_destroy: true

  has_many :prd_home_tools
  accepts_nested_attributes_for :prd_home_tools, allow_destroy: true

  has_many :prd_home_window_treatments
  accepts_nested_attributes_for :prd_home_window_treatments, allow_destroy: true

  # creating many to many relationship with prd_types table
  has_many :prd_type_items
  has_many :prd_types, through: :prd_type_items

  # creating one to many relationship with prd_item_images table
  has_many :prd_item_images, dependent: :destroy, inverse_of: :prd_item
  accepts_nested_attributes_for :prd_item_images, allow_destroy: true # , reject_if: ->(attrs) { attrs['image'].blank? || attrs['description'].blank? }


  has_many :prd_within_colombo_deliveries, dependent: :destroy, inverse_of: :prd_item
  accepts_nested_attributes_for :prd_within_colombo_deliveries, allow_destroy: true

  has_many :prd_greater_colombo_deliveries, dependent: :destroy, inverse_of: :prd_item
  accepts_nested_attributes_for :prd_greater_colombo_deliveries, allow_destroy: true

  has_many :prd_all_island_deliveries, dependent: :destroy, inverse_of: :prd_item
  accepts_nested_attributes_for :prd_all_island_deliveries, allow_destroy: true

  # creating many to many relationship with prd_tags table
  has_many :prd_item_tags
  has_many :prd_tags, through: :prd_item_tags

end
