require 'test_helper'

class UsrVenderControllerTest < ActionDispatch::IntegrationTest
  test "should get registration" do
    get usr_vender_registration_url
    assert_response :success
  end

  test "should get index" do
    get usr_vender_index_url
    assert_response :success
  end

end
