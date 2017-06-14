class CreateUsrRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :usr_roles do |t|

      t.string :role_name
      t.text :description

      t.timestamps
    end
  end
end
