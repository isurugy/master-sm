require 'test_helper'

class UsrRoleControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get usr_role_index_url
    assert_response :success
  end

end
