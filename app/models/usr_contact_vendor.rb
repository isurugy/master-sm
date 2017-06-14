class UsrContactVendor < ApplicationRecord
  belongs_to :usr_contact
  belongs_to :usr_vendor_property
  accepts_nested_attributes_for :usr_vendor_property,
                                reject_if: :all_blank
end
