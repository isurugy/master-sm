class AddUsrVenderPropertyToUsrAdditionalUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :usr_additional_users, :usr_vendor_property, foreign_key: true
  end
end
