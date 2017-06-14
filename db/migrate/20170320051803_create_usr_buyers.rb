class CreateUsrBuyers < ActiveRecord::Migration[5.0]
  def change
    create_table :usr_buyers do |t|
      t.date :anniversary
      t.integer :usr_contact
      t.timestamps
    end
  end
end
