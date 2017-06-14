require 'test_helper'

class UsrRolesControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get usr_roles_url
    assert_response :success
  end

  test "should get new" do
    get new_usr_role_url
    assert_response :success
  end

end
