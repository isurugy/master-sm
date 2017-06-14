class CreateUsrContactRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :usr_contact_roles do |t|

      t.belongs_to :usr_role, index: true
      t.belongs_to :usr_contact, index: true

      t.timestamps
    end
  end
end
