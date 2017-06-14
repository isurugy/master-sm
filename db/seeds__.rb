# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#
# r1 = UsrRole.create(role_name: "Shop adminitrator", description: "test 01")
# r2 = UsrRole.create(role_name: "Supervisor", description: "test 02")
# r3 = UsrRole.create(role_name: "Cashier", description: "test 03")
# r4 = UsrRole.create(role_name: "Price Changer", description: "test 04")

# pm1 = UsrPermission.create(permission_name: "Price")
# pm2 = UsrPermission.create(permission_name: "Location")
# pm3 = UsrPermission.create(permission_name: "Description")
# pm4 = UsrPermission.create(permission_name: "Features")
#
ct1= PrdCategory.create(name: "Computer, Handhelds & Electronics")
ct2= PrdCategory.create(name: "Cameras")
ct3= PrdCategory.create(name: "Baby Products")
ct4= PrdCategory.create(name: "Toys")
ct5= PrdCategory.create(name: "Sporting")
ct6= PrdCategory.create(name: "Books & Stationary")
ct7= PrdCategory.create(name: "Fashion")
ct8= PrdCategory.create(name: "Home")
ct9= PrdCategory.create(name: "Health & Beauty")

subct1 = PrdSubCategory.create(name: "Bath", prd_categories_id:ct8.id)
subct2 = PrdSubCategory.create(name: "Bedding", prd_categories_id:ct8.id)
subct3 = PrdSubCategory.create(name: "Crafts", prd_categories_id:ct8.id)
subct4 = PrdSubCategory.create(name: "Furniture", prd_categories_id:ct8.id)
subct5 = PrdSubCategory.create(name: "Home Décor", prd_categories_id:ct8.id)
subct6 = PrdSubCategory.create(name: "Home Improvement", prd_categories_id:ct8.id)
subct7 = PrdSubCategory.create(name: "Household Supplies & Cleaning", prd_categories_id:ct8.id)
subct8 = PrdSubCategory.create(name: "Kitchen, Dining & Bar", prd_categories_id:ct8.id)
subct9 = PrdSubCategory.create(name: "Lamps, Lighting & Ceiling Fans", prd_categories_id:ct8.id)
subct10 = PrdSubCategory.create(name: "Pet Supplies", prd_categories_id:ct8.id)
subct11 = PrdSubCategory.create(name: "Rugs & Carpets",prd_categories_id:ct8.id)
subct12 = PrdSubCategory.create(name: "Tools", prd_categories_id:ct8.id)
subct13 = PrdSubCategory.create(name: "Window Treatments & Hardware", prd_categories_id:ct8.id)
subct14 = PrdSubCategory.create(name: "Yard, Garden & Outdoor Living", prd_categories_id:ct8.id)

type1 = PrdType.create(name: "Towels & Washcloths", prd_sub_category_id:subct1.id)
type2 = PrdType.create(name: "Bathmats, Rugs & Toilet Covers",prd_sub_category_id:subct1.id)
type3 = PrdType.create(name: "Shower Curtains", prd_sub_category_id:subct1.id)
type4 = PrdType.create(name: "Bath Accessory Sets", prd_sub_category_id:subct1.id)
type5 = PrdType.create(name: "Toothbrush Holders", prd_sub_category_id:subct1.id)
type6 = PrdType.create(name: "Soap Dishes & Dispensers", prd_sub_category_id:subct1.id)
type7 = PrdType.create(name: "Mirrors", prd_sub_category_id:subct1.id)
type8 = PrdType.create(name: "Bath Caddies & Storage", prd_sub_category_id:subct1.id)
type9 = PrdType.create(name: "Non-Slip Appliques & Mats", prd_sub_category_id:subct1.id)
type10 = PrdType.create(name: "Wall Hooks & Hangers", prd_sub_category_id:subct1.id)
type11 = PrdType.create(name: "Tissue Box Covers", prd_sub_category_id:subct1.id)
type12 = PrdType.create(name: "Toilet Brushes & Sets", prd_sub_category_id:subct1.id)
type13 = PrdType.create(name: "Scales", prd_sub_category_id:subct1.id)
type14 = PrdType.create(name: "Shower Curtain Hooks",prd_sub_category_id:subct1.id)
type15 = PrdType.create(name: "Shelves", prd_sub_category_id:subct1.id)
type16 = PrdType.create(name: "Toilet Paper Storage & Covers", prd_sub_category_id:subct1.id)
type17 = PrdType.create(name: "Medicine Cabinets", prd_sub_category_id:subct1.id)
type18 = PrdType.create(name: "Tumblers", prd_sub_category_id:subct1.id)


item_variation1 = PrdVariationItem.create(name:"material")
item_variation2 = PrdVariationItem.create(name:"color")
item_variation3 = PrdVariationItem.create(name:"room")
item_variation4 = PrdVariationItem.create(name:"size")


variation1 = PrdVariation.create(value:"red", prd_variation_item_id:item_variation2.id)
variation2 = PrdVariation.create(value:"green", prd_variation_item_id:item_variation2.id)
variation3 = PrdVariation.create(value:"yellow", prd_variation_item_id:item_variation2.id)
variation4 = PrdVariation.create(value:"blue", prd_variation_item_id:item_variation2.id)
variation5 = PrdVariation.create(value:"plastic", prd_variation_item_id:item_variation1.id)
variation6 = PrdVariation.create(value:"wood", prd_variation_item_id:item_variation1.id)
variation7 = PrdVariation.create(value:"polythene", prd_variation_item_id:item_variation1.id)
variation8 = PrdVariation.create(value:"glass", prd_variation_item_id:item_variation1.id)
variation9 = PrdVariation.create(value:"steel", prd_variation_item_id:item_variation1.id)
variation10 = PrdVariation.create(value:"bedroom", prd_variation_item_id:item_variation3.id)
variation11 = PrdVariation.create(value:"living-room", prd_variation_item_id:item_variation3.id)
variation12 = PrdVariation.create(value:"tv-lounge", prd_variation_item_id:item_variation3.id)
variation13 = PrdVariation.create(value:"dining-room", prd_variation_item_id:item_variation3.id)
variation14 = PrdVariation.create(value:"king", prd_variation_item_id:item_variation4.id)
variation15 = PrdVariation.create(value:"queen", prd_variation_item_id:item_variation4.id)
variation16 = PrdVariation.create(value:"standard ", prd_variation_item_id:item_variation4.id)
variation17 = PrdVariation.create(value:"twin", prd_variation_item_id:item_variation4.id)
variation18 = PrdVariation.create(value:"Full", prd_variation_item_id:item_variation4.id)


var_type1 = PrdTypeVariation.create(prd_type_id:type1.id,prd_variation_item_id:item_variation2.id, prd_variation_id:variation1.id )
var_type2 = PrdTypeVariation.create(prd_type_id:type1.id,prd_variation_item_id:item_variation2.id, prd_variation_id:variation2.id )
var_type3 = PrdTypeVariation.create(prd_type_id:type1.id,prd_variation_item_id:item_variation2.id, prd_variation_id:variation3.id )
var_type4 = PrdTypeVariation.create(prd_type_id:type1.id,prd_variation_item_id:item_variation2.id, prd_variation_id:variation4.id )
var_type5 = PrdTypeVariation.create(prd_type_id:type1.id,prd_variation_item_id:item_variation1.id, prd_variation_id:variation5.id )
var_type6 = PrdTypeVariation.create(prd_type_id:type1.id,prd_variation_item_id:item_variation1.id, prd_variation_id:variation6.id )






# type19 = PrdType.create(type: "")
# type20 = PrdType.create(type: "")
# type21 = PrdType.create(type: "")
# type22 = PrdType.create(type: "")
# type23 = PrdType.create(type: "")
# type24 = PrdType.create(type: "")
# type25 = PrdType.create(type: "")
# type26 = PrdType.create(type: "")
# type27 = PrdType.create(type: "")
# type28 = PrdType.create(type: "")
# type29 = PrdType.create(type: "")
# type30 = PrdType.create(type: "")

# type19 = PrdType.create(type: "")
# type20 = PrdType.create(type: "")
# type21 = PrdType.create(type: "")
# type22 = PrdType.create(type: "")
# type23 = PrdType.create(type: "")
# type24 = PrdType.create(type: "")
# type25 = PrdType.create(type: "")
# type26 = PrdType.create(type: "")
# type27 = PrdType.create(type: "")
# type28 = PrdType.create(type: "")
# type29 = PrdType.create(type: "")
# type30 = PrdType.create(type: "")



# r1.usr_permissions << [pm1, pm2, pm3, pm4]
# r2.usr_permissions << [pm2, pm3]
# r3.usr_permissions << [pm1, pm2]
# r4.usr_permissions << [pm1]