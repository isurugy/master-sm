class CreateUsrRolePermissions < ActiveRecord::Migration[5.0]
  def change
    create_table :usr_role_permissions do |t|

      t.belongs_to :usr_role, index: true
      t.belongs_to :usr_permission, index: true
      t.string :value

      t.timestamps
    end
  end
end
