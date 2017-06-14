require 'test_helper'

class PrdDeliveriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @prd_delivery = prd_deliveries(:one)
  end

  test "should get index" do
    get prd_deliveries_url
    assert_response :success
  end

  test "should get new" do
    get new_prd_delivery_url
    assert_response :success
  end

  test "should create prd_delivery" do
    assert_difference('PrdDelivery.count') do
      post prd_deliveries_url, params: { prd_delivery: {  } }
    end

    assert_redirected_to prd_delivery_url(PrdDelivery.last)
  end

  test "should show prd_delivery" do
    get prd_delivery_url(@prd_delivery)
    assert_response :success
  end

  test "should get edit" do
    get edit_prd_delivery_url(@prd_delivery)
    assert_response :success
  end

  test "should update prd_delivery" do
    patch prd_delivery_url(@prd_delivery), params: { prd_delivery: {  } }
    assert_redirected_to prd_delivery_url(@prd_delivery)
  end

  test "should destroy prd_delivery" do
    assert_difference('PrdDelivery.count', -1) do
      delete prd_delivery_url(@prd_delivery)
    end

    assert_redirected_to prd_deliveries_url
  end
end
