class UsrVendorProperty < ApplicationRecord
  has_many :usr_additional_users, dependent: :destroy
  accepts_nested_attributes_for :usr_additional_users, allow_destroy: true, reject_if: proc {|att| att['email'].blank?}
  has_many :usr_contact_vendors
  has_many :usr_contacts, through: :usr_contact_vendors
  has_many :usr_vendor_branches
  accepts_nested_attributes_for :usr_vendor_branches

  has_many :prd_items

  validates :shop_name, presence: true
end
