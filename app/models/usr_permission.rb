class UsrPermission < ApplicationRecord

  # creating many to many relationship with usr_role table
  has_many :usr_role_permissions
  has_many :usr_roles, through: :usr_role_permissions

  scope :sorted, lambda { order("permission_name ASC")}

end
