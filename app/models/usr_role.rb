class UsrRole < ApplicationRecord

  # creating many to many relationship with usr_permission table
  has_many :usr_role_permissions
  has_many :usr_permissions, through: :usr_role_permissions

  # creating many to many relationship with usr_user table
  has_many :usr_contact_roles
  has_many :usr_contacts, through: :usr_contact_roles

  # role_name validation
  validates :role_name, :description, presence: true

end
