class UsrBuyer < ApplicationRecord
  belongs_to :usr_contact
  has_many :usr_buyer_billing_addresses
  has_many :usr_buyer_delivery_addresses
  has_many :usr_buyer_payment_methods

  mount_uploader :user_image, UsrContactUploader

end