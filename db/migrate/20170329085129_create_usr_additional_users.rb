class CreateUsrAdditionalUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :usr_additional_users do |t|
      t.string :email
      t.string :role

      t.timestamps
    end
  end
end
