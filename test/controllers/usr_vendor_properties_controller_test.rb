require 'test_helper'

class UsrVendorPropertiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @usr_vendor_property = usr_vendor_properties(:one)
  end

  test "should get index" do
    get usr_vendor_properties_url
    assert_response :success
  end

  test "should get new" do
    get new_usr_vendor_property_url
    assert_response :success
  end

  test "should create usr_vendor_property" do
    assert_difference('UsrVendorProperty.count') do
      post usr_vendor_properties_url, params: { usr_vendor_property: { mobile: @usr_vendor_property.mobile, shop_name: @usr_vendor_property.shop_name, specified_area: @usr_vendor_property.specified_area, website: @usr_vendor_property.website } }
    end

    assert_redirected_to usr_vendor_property_url(UsrVendorProperty.last)
  end

  test "should show usr_vendor_property" do
    get usr_vendor_property_url(@usr_vendor_property)
    assert_response :success
  end

  test "should get edit" do
    get edit_usr_vendor_property_url(@usr_vendor_property)
    assert_response :success
  end

  test "should update usr_vendor_property" do
    patch usr_vendor_property_url(@usr_vendor_property), params: { usr_vendor_property: { mobile: @usr_vendor_property.mobile, shop_name: @usr_vendor_property.shop_name, specified_area: @usr_vendor_property.specified_area, website: @usr_vendor_property.website } }
    assert_redirected_to usr_vendor_property_url(@usr_vendor_property)
  end

  test "should destroy usr_vendor_property" do
    assert_difference('UsrVendorProperty.count', -1) do
      delete usr_vendor_property_url(@usr_vendor_property)
    end

    assert_redirected_to usr_vendor_properties_url
  end
end
