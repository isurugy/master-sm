require 'test_helper'

class UsrControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get usr_index_url
    assert_response :success
  end

  test "should get register" do
    get usr_register_url
    assert_response :success
  end

end
