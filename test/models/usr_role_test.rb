require 'test_helper'

class UsrRoleTest < ActiveSupport::TestCase

  def setup
    @role = usr_roles(:role1) #role one inside fixtures -> usr_roles.yml
  end

  test 'valid user' do
    assert @role.valid?
  end

  test 'invalid without role name' do
    @role.role_name = nil
    refute @role.valid?, 'role is valid without a name'
    assert_not_nil @role.errors[:role_name], 'no validation error for name present'
  end

  test 'invalid without description' do
    @role.description = nil
    refute @role.valid?,  'role is valid without a description'
    assert_not_nil @role.errors[:description], 'no validation error for description present'
  end

end
