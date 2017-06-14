require 'test_helper'

class BuyerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get buyer_index_url
    assert_response :success
  end

  test "should get new2" do
    get buyer_new_url
    assert_response :success
  end

  test "should get create" do
    get buyer_create_url
    assert_response :success
  end

  test "should get edit" do
    get buyer_edit_url
    assert_response :success
  end

  test "should get update" do
    get buyer_update_url
    assert_response :success
  end

  test "should get destroy" do
    get buyer_destroy_url
    assert_response :success
  end

end
