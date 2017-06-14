class UsrBuyerPaymentMethod < ApplicationRecord
  #here we can give oure encrption key for each field of usr_buyer_payment_method fields
  attr_encrypted_options.merge!(:encode => true)
  attr_encrypted :card_number, key: 'blow blow blow blow blow blow bl'
  attr_encrypted :cvv, key: 'blow blow blow blow blow blow bl'
  attr_encrypted :expiry_date, key: 'blow blow blow blow blow blow bl'
  belongs_to :usr_buyer
end
