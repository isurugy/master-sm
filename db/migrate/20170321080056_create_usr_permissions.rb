class CreateUsrPermissions < ActiveRecord::Migration[5.0]
  def change
    create_table :usr_permissions do |t|

      t.string :permission_name

      t.timestamps
    end
  end
end
