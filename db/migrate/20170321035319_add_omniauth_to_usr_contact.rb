class AddOmniauthToUsrContact < ActiveRecord::Migration[5.0]
  def change
    add_column :usr_contacts, :provider, :string
    add_column :usr_contacts, :uid, :string
  end
end
