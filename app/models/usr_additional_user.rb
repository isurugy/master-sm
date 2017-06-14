class UsrAdditionalUser < ApplicationRecord
  belongs_to :UsrVenderProperty , optional: true
end
