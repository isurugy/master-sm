json.extract! usr_buyer_payment_method, :id, :card_name, :encrypted_card_number, :encrypted_cvv, :encrypted_expiry_date, :created_at, :updated_at
json.url usr_buyer_payment_method_url(usr_buyer_payment_method, format: :json)
