# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170612052741) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "prd_all_island_deliveries", force: :cascade do |t|
    t.integer  "delivery_period"
    t.money    "delivery_rate",   scale: 2
    t.integer  "prd_item_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["prd_item_id"], name: "index_prd_all_island_deliveries_on_prd_item_id", using: :btree
  end

  create_table "prd_categories", force: :cascade do |t|
    t.string   "name"
    t.string   "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prd_greater_colombo_deliveries", force: :cascade do |t|
    t.integer  "delivery_period"
    t.money    "delivery_rate",   scale: 2
    t.integer  "prd_item_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["prd_item_id"], name: "index_prd_greater_colombo_deliveries_on_prd_item_id", using: :btree
  end

  create_table "prd_home_baths", force: :cascade do |t|
    t.string   "material"
    t.string   "color"
    t.integer  "prd_sub_category_id"
    t.integer  "prd_item_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["prd_item_id"], name: "index_prd_home_baths_on_prd_item_id", using: :btree
    t.index ["prd_sub_category_id"], name: "index_prd_home_baths_on_prd_sub_category_id", using: :btree
  end

  create_table "prd_home_beddings", force: :cascade do |t|
    t.string   "material"
    t.string   "color"
    t.string   "size"
    t.integer  "prd_sub_category_id"
    t.integer  "prd_item_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["prd_item_id"], name: "index_prd_home_beddings_on_prd_item_id", using: :btree
    t.index ["prd_sub_category_id"], name: "index_prd_home_beddings_on_prd_sub_category_id", using: :btree
  end

  create_table "prd_home_furnitures", force: :cascade do |t|
    t.string   "material"
    t.string   "color"
    t.string   "room"
    t.integer  "prd_sub_category_id"
    t.integer  "prd_item_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["prd_item_id"], name: "index_prd_home_furnitures_on_prd_item_id", using: :btree
    t.index ["prd_sub_category_id"], name: "index_prd_home_furnitures_on_prd_sub_category_id", using: :btree
  end

  create_table "prd_home_gardens", force: :cascade do |t|
    t.integer  "prd_sub_category_id"
    t.integer  "prd_item_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["prd_item_id"], name: "index_prd_home_gardens_on_prd_item_id", using: :btree
    t.index ["prd_sub_category_id"], name: "index_prd_home_gardens_on_prd_sub_category_id", using: :btree
  end

  create_table "prd_home_hh_supply_cleans", force: :cascade do |t|
    t.integer  "prd_sub_category_id"
    t.integer  "prd_item_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["prd_item_id"], name: "index_prd_home_hh_supply_cleans_on_prd_item_id", using: :btree
    t.index ["prd_sub_category_id"], name: "index_prd_home_hh_supply_cleans_on_prd_sub_category_id", using: :btree
  end

  create_table "prd_home_home_appliances", force: :cascade do |t|
    t.string   "power"
    t.integer  "prd_sub_category_id"
    t.integer  "prd_item_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["prd_item_id"], name: "index_prd_home_home_appliances_on_prd_item_id", using: :btree
    t.index ["prd_sub_category_id"], name: "index_prd_home_home_appliances_on_prd_sub_category_id", using: :btree
  end

  create_table "prd_home_home_decors", force: :cascade do |t|
    t.string   "color"
    t.string   "room"
    t.integer  "prd_sub_category_id"
    t.integer  "prd_item_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["prd_item_id"], name: "index_prd_home_home_decors_on_prd_item_id", using: :btree
    t.index ["prd_sub_category_id"], name: "index_prd_home_home_decors_on_prd_sub_category_id", using: :btree
  end

  create_table "prd_home_home_improvements", force: :cascade do |t|
    t.integer  "prd_sub_category_id"
    t.integer  "prd_item_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["prd_item_id"], name: "index_prd_home_home_improvements_on_prd_item_id", using: :btree
    t.index ["prd_sub_category_id"], name: "index_prd_home_home_improvements_on_prd_sub_category_id", using: :btree
  end

  create_table "prd_home_kitchen_appliances", force: :cascade do |t|
    t.string   "material"
    t.string   "power"
    t.integer  "prd_sub_category_id"
    t.integer  "prd_item_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["prd_item_id"], name: "index_prd_home_kitchen_appliances_on_prd_item_id", using: :btree
    t.index ["prd_sub_category_id"], name: "index_prd_home_kitchen_appliances_on_prd_sub_category_id", using: :btree
  end

  create_table "prd_home_kitchen_dining_bars", force: :cascade do |t|
    t.string   "material"
    t.string   "color"
    t.integer  "prd_sub_category_id"
    t.integer  "prd_item_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["prd_item_id"], name: "index_prd_home_kitchen_dining_bars_on_prd_item_id", using: :btree
    t.index ["prd_sub_category_id"], name: "index_prd_home_kitchen_dining_bars_on_prd_sub_category_id", using: :btree
  end

  create_table "prd_home_lamps_lightings", force: :cascade do |t|
    t.string   "power"
    t.integer  "prd_sub_category_id"
    t.integer  "prd_item_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["prd_item_id"], name: "index_prd_home_lamps_lightings_on_prd_item_id", using: :btree
    t.index ["prd_sub_category_id"], name: "index_prd_home_lamps_lightings_on_prd_sub_category_id", using: :btree
  end

  create_table "prd_home_pet_supplies", force: :cascade do |t|
    t.integer  "prd_sub_category_id"
    t.integer  "prd_item_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["prd_item_id"], name: "index_prd_home_pet_supplies_on_prd_item_id", using: :btree
    t.index ["prd_sub_category_id"], name: "index_prd_home_pet_supplies_on_prd_sub_category_id", using: :btree
  end

  create_table "prd_home_tools", force: :cascade do |t|
    t.integer  "prd_sub_category_id"
    t.integer  "prd_item_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["prd_item_id"], name: "index_prd_home_tools_on_prd_item_id", using: :btree
    t.index ["prd_sub_category_id"], name: "index_prd_home_tools_on_prd_sub_category_id", using: :btree
  end

  create_table "prd_home_window_treatments", force: :cascade do |t|
    t.string   "material"
    t.string   "color"
    t.integer  "prd_sub_category_id"
    t.integer  "prd_item_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["prd_item_id"], name: "index_prd_home_window_treatments_on_prd_item_id", using: :btree
    t.index ["prd_sub_category_id"], name: "index_prd_home_window_treatments_on_prd_sub_category_id", using: :btree
  end

  create_table "prd_item_images", force: :cascade do |t|
    t.string   "image"
    t.string   "description"
    t.integer  "prd_item_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["prd_item_id"], name: "index_prd_item_images_on_prd_item_id", using: :btree
  end

  create_table "prd_item_tags", force: :cascade do |t|
    t.integer  "prd_item_id"
    t.integer  "prd_tag_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["prd_item_id"], name: "index_prd_item_tags_on_prd_item_id", using: :btree
    t.index ["prd_tag_id"], name: "index_prd_item_tags_on_prd_tag_id", using: :btree
  end

  create_table "prd_item_variation_stores", force: :cascade do |t|
    t.integer  "prd_type_variation_id"
    t.integer  "prd_item_id"
    t.float    "stock"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["prd_item_id"], name: "index_prd_item_variation_stores_on_prd_item_id", using: :btree
    t.index ["prd_type_variation_id"], name: "index_prd_item_variation_stores_on_prd_type_variation_id", using: :btree
  end

  create_table "prd_items", force: :cascade do |t|
    t.string   "item_name"
    t.string   "brand"
    t.string   "item_no"
    t.text     "short_description"
    t.text     "long_description"
    t.money    "price",                  scale: 2
    t.money    "base_price",             scale: 2
    t.float    "price_discount"
    t.float    "percentage_discount"
    t.integer  "stock_count"
    t.string   "availability"
    t.integer  "usr_vendor_property_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "prd_type_id"
    t.index ["usr_vendor_property_id"], name: "index_prd_items_on_usr_vendor_property_id", using: :btree
  end

  create_table "prd_orders", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "item_id"
    t.money    "item_price",  scale: 2
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "prd_sub_categories", force: :cascade do |t|
    t.string   "name"
    t.string   "icon"
    t.integer  "prd_categories_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["prd_categories_id"], name: "index_prd_sub_categories_on_prd_categories_id", using: :btree
  end

  create_table "prd_sub_category_tags", force: :cascade do |t|
    t.integer  "prd_sub_category_id"
    t.integer  "prd_tag_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["prd_sub_category_id"], name: "index_prd_sub_category_tags_on_prd_sub_category_id", using: :btree
    t.index ["prd_tag_id"], name: "index_prd_sub_category_tags_on_prd_tag_id", using: :btree
  end

  create_table "prd_tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prd_type_items", force: :cascade do |t|
    t.integer  "prd_item_id"
    t.integer  "prd_type_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["prd_item_id"], name: "index_prd_type_items_on_prd_item_id", using: :btree
    t.index ["prd_type_id"], name: "index_prd_type_items_on_prd_type_id", using: :btree
  end

  create_table "prd_type_variations", force: :cascade do |t|
    t.integer  "prd_variation_item_id"
    t.integer  "prd_variation_id"
    t.integer  "prd_type_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["prd_type_id"], name: "index_prd_type_variations_on_prd_type_id", using: :btree
    t.index ["prd_variation_id"], name: "index_prd_type_variations_on_prd_variation_id", using: :btree
    t.index ["prd_variation_item_id"], name: "index_prd_type_variations_on_prd_variation_item_id", using: :btree
  end

  create_table "prd_types", force: :cascade do |t|
    t.integer  "prd_sub_category_id"
    t.string   "name"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["prd_sub_category_id"], name: "index_prd_types_on_prd_sub_category_id", using: :btree
  end

  create_table "prd_variation_items", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prd_variations", force: :cascade do |t|
    t.string   "value"
    t.integer  "prd_variation_item_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["prd_variation_item_id"], name: "index_prd_variations_on_prd_variation_item_id", using: :btree
  end

  create_table "prd_within_colombo_deliveries", force: :cascade do |t|
    t.integer  "delivery_period"
    t.money    "delivery_rate",   scale: 2
    t.integer  "prd_item_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["prd_item_id"], name: "index_prd_within_colombo_deliveries_on_prd_item_id", using: :btree
  end

  create_table "usr_additional_users", force: :cascade do |t|
    t.string   "email"
    t.string   "role"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "usr_vendor_property_id"
    t.index ["usr_vendor_property_id"], name: "index_usr_additional_users_on_usr_vendor_property_id", using: :btree
  end

  create_table "usr_buyer_billing_addresses", force: :cascade do |t|
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "city"
    t.integer  "zip_code"
    t.string   "country"
    t.integer  "usr_contact_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["usr_contact_id"], name: "index_usr_buyer_billing_addresses_on_usr_contact_id", using: :btree
  end

  create_table "usr_buyer_delivery_addresses", force: :cascade do |t|
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "city"
    t.integer  "zip_code"
    t.string   "country"
    t.integer  "usr_contact_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["usr_contact_id"], name: "index_usr_buyer_delivery_addresses_on_usr_contact_id", using: :btree
  end

  create_table "usr_buyer_payment_methods", force: :cascade do |t|
    t.string   "card_name"
    t.string   "encrypted_card_number"
    t.string   "encrypted_cvv"
    t.string   "encrypted_expiry_date"
    t.integer  "usr_contact_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["usr_contact_id"], name: "index_usr_buyer_payment_methods_on_usr_contact_id", using: :btree
  end

  create_table "usr_buyers", force: :cascade do |t|
    t.date     "anniversary"
    t.integer  "usr_contact"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "usr_contact_roles", force: :cascade do |t|
    t.integer  "usr_role_id"
    t.integer  "usr_contact_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["usr_contact_id"], name: "index_usr_contact_roles_on_usr_contact_id", using: :btree
    t.index ["usr_role_id"], name: "index_usr_contact_roles_on_usr_role_id", using: :btree
  end

  create_table "usr_contact_vendors", force: :cascade do |t|
    t.integer  "usr_contact_id"
    t.integer  "usr_vendor_property_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["usr_contact_id"], name: "index_usr_contact_vendors_on_usr_contact_id", using: :btree
    t.index ["usr_vendor_property_id"], name: "index_usr_contact_vendors_on_usr_vendor_property_id", using: :btree
  end

  create_table "usr_contacts", force: :cascade do |t|
    t.string   "first_name"
    t.string   "mobile"
    t.string   "last_name"
    t.string   "gender"
    t.string   "image"
    t.datetime "dob"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.index ["email"], name: "index_usr_contacts_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_usr_contacts_on_reset_password_token", unique: true, using: :btree
  end

  create_table "usr_permissions", force: :cascade do |t|
    t.string   "permission_name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "usr_role_permissions", force: :cascade do |t|
    t.integer  "usr_role_id"
    t.integer  "usr_permission_id"
    t.string   "value"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["usr_permission_id"], name: "index_usr_role_permissions_on_usr_permission_id", using: :btree
    t.index ["usr_role_id"], name: "index_usr_role_permissions_on_usr_role_id", using: :btree
  end

  create_table "usr_roles", force: :cascade do |t|
    t.string   "role_name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "usr_vendor_branch_contact_details", force: :cascade do |t|
    t.string   "contact_method"
    t.string   "value"
    t.integer  "usr_vendor_branch_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["usr_vendor_branch_id"], name: "index_usr_vendor_branch_contact_details_on_usr_vendor_branch_id", using: :btree
  end

  create_table "usr_vendor_branches", force: :cascade do |t|
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "city"
    t.integer  "zip_code"
    t.integer  "usr_vendor_property_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["usr_vendor_property_id"], name: "index_usr_vendor_branches_on_usr_vendor_property_id", using: :btree
  end

  create_table "usr_vendor_properties", force: :cascade do |t|
    t.string   "specified_area"
    t.string   "mobile"
    t.string   "website"
    t.string   "shop_name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_foreign_key "prd_all_island_deliveries", "prd_items"
  add_foreign_key "prd_greater_colombo_deliveries", "prd_items"
  add_foreign_key "prd_home_baths", "prd_items"
  add_foreign_key "prd_home_baths", "prd_sub_categories"
  add_foreign_key "prd_home_beddings", "prd_items"
  add_foreign_key "prd_home_beddings", "prd_sub_categories"
  add_foreign_key "prd_home_furnitures", "prd_items"
  add_foreign_key "prd_home_furnitures", "prd_sub_categories"
  add_foreign_key "prd_home_gardens", "prd_items"
  add_foreign_key "prd_home_gardens", "prd_sub_categories"
  add_foreign_key "prd_home_hh_supply_cleans", "prd_items"
  add_foreign_key "prd_home_hh_supply_cleans", "prd_sub_categories"
  add_foreign_key "prd_home_home_appliances", "prd_items"
  add_foreign_key "prd_home_home_appliances", "prd_sub_categories"
  add_foreign_key "prd_home_home_decors", "prd_items"
  add_foreign_key "prd_home_home_decors", "prd_sub_categories"
  add_foreign_key "prd_home_home_improvements", "prd_items"
  add_foreign_key "prd_home_home_improvements", "prd_sub_categories"
  add_foreign_key "prd_home_kitchen_appliances", "prd_items"
  add_foreign_key "prd_home_kitchen_appliances", "prd_sub_categories"
  add_foreign_key "prd_home_kitchen_dining_bars", "prd_items"
  add_foreign_key "prd_home_kitchen_dining_bars", "prd_sub_categories"
  add_foreign_key "prd_home_lamps_lightings", "prd_items"
  add_foreign_key "prd_home_lamps_lightings", "prd_sub_categories"
  add_foreign_key "prd_home_pet_supplies", "prd_items"
  add_foreign_key "prd_home_pet_supplies", "prd_sub_categories"
  add_foreign_key "prd_home_tools", "prd_items"
  add_foreign_key "prd_home_tools", "prd_sub_categories"
  add_foreign_key "prd_home_window_treatments", "prd_items"
  add_foreign_key "prd_home_window_treatments", "prd_sub_categories"
  add_foreign_key "prd_item_images", "prd_items"
  add_foreign_key "prd_item_variation_stores", "prd_items"
  add_foreign_key "prd_item_variation_stores", "prd_type_variations"
  add_foreign_key "prd_items", "usr_vendor_properties"
  add_foreign_key "prd_sub_categories", "prd_categories", column: "prd_categories_id"
  add_foreign_key "prd_type_variations", "prd_types"
  add_foreign_key "prd_type_variations", "prd_variation_items"
  add_foreign_key "prd_type_variations", "prd_variations"
  add_foreign_key "prd_types", "prd_sub_categories"
  add_foreign_key "prd_variations", "prd_variation_items"
  add_foreign_key "prd_within_colombo_deliveries", "prd_items"
  add_foreign_key "usr_additional_users", "usr_vendor_properties"
  add_foreign_key "usr_buyer_billing_addresses", "usr_contacts"
  add_foreign_key "usr_buyer_delivery_addresses", "usr_contacts"
  add_foreign_key "usr_buyer_payment_methods", "usr_contacts"
  add_foreign_key "usr_contact_vendors", "usr_contacts"
  add_foreign_key "usr_contact_vendors", "usr_vendor_properties"
  add_foreign_key "usr_vendor_branch_contact_details", "usr_vendor_branches"
  add_foreign_key "usr_vendor_branches", "usr_vendor_properties"
end
