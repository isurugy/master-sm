require 'test_helper'

class CslAdminControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get csl_admin_index_url
    assert_response :success
  end

end
