require 'test_helper'

class UsrBuyerPaymentMethodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @usr_buyer_payment_method = usr_buyer_payment_methods(:one)
  end

  test "should get index" do
    get usr_buyer_payment_methods_url
    assert_response :success
  end

  test "should get new" do
    get new_usr_buyer_payment_method_url
    assert_response :success
  end

  test "should create usr_buyer_payment_method" do
    assert_difference('UsrBuyerPaymentMethod.count') do
      post usr_buyer_payment_methods_url, params: { usr_buyer_payment_method: { card_name: @usr_buyer_payment_method.card_name, encrypted_card_number: @usr_buyer_payment_method.encrypted_card_number, encrypted_cvv: @usr_buyer_payment_method.encrypted_cvv, encrypted_expiry_date: @usr_buyer_payment_method.encrypted_expiry_date } }
    end

    assert_redirected_to usr_buyer_payment_method_url(UsrBuyerPaymentMethod.last)
  end

  test "should show usr_buyer_payment_method" do
    get usr_buyer_payment_method_url(@usr_buyer_payment_method)
    assert_response :success
  end

  test "should get edit" do
    get edit_usr_buyer_payment_method_url(@usr_buyer_payment_method)
    assert_response :success
  end

  test "should update usr_buyer_payment_method" do
    patch usr_buyer_payment_method_url(@usr_buyer_payment_method), params: { usr_buyer_payment_method: { card_name: @usr_buyer_payment_method.card_name, encrypted_card_number: @usr_buyer_payment_method.encrypted_card_number, encrypted_cvv: @usr_buyer_payment_method.encrypted_cvv, encrypted_expiry_date: @usr_buyer_payment_method.encrypted_expiry_date } }
    assert_redirected_to usr_buyer_payment_method_url(@usr_buyer_payment_method)
  end

  test "should destroy usr_buyer_payment_method" do
    assert_difference('UsrBuyerPaymentMethod.count', -1) do
      delete usr_buyer_payment_method_url(@usr_buyer_payment_method)
    end

    assert_redirected_to usr_buyer_payment_methods_url
  end
end
