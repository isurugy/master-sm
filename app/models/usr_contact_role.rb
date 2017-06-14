class UsrContactRole < ApplicationRecord

  # creating many to many relationship with usr_user table and usr_role table
  # this is intermediate table
  belongs_to :usr_contact
  belongs_to :usr_role

end
