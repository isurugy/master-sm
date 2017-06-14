require 'test_helper'

class PrdItemsControllerTest < ActionDispatch::IntegrationTest

  test "should get new" do
    get new_prd_item_url
    assert_response :success
  end

  test "should get index" do
    get prd_items_path
    assert_response :success
  end
end
