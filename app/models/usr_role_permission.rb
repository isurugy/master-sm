class UsrRolePermission < ApplicationRecord

  # creating many to many relationship with usr_role table and usr_permission table
  # this is intermediate table
  belongs_to :usr_role
  belongs_to :usr_permission
end
