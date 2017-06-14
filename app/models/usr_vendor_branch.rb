class UsrVendorBranch < ApplicationRecord
  belongs_to :usr_vendor_property
  has_many :usr_vendor_branch_contact_details
  accepts_nested_attributes_for :usr_vendor_branch_contact_details
end
