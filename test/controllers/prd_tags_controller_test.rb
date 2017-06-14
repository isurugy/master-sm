require 'test_helper'

class PrdTagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @prd_tag = prd_tags(:one)
  end

  test "should get index" do
    get prd_tags_url
    assert_response :success
  end

  test "should get new" do
    get new_prd_tag_url
    assert_response :success
  end

  test "should create prd_tag" do
    assert_difference('PrdTag.count') do
      post prd_tags_url, params: { prd_tag: { name: @prd_tag.name } }
    end

    assert_redirected_to prd_tag_url(PrdTag.last)
  end

  test "should show prd_tag" do
    get prd_tag_url(@prd_tag)
    assert_response :success
  end

  test "should get edit" do
    get edit_prd_tag_url(@prd_tag)
    assert_response :success
  end

  test "should update prd_tag" do
    patch prd_tag_url(@prd_tag), params: { prd_tag: { name: @prd_tag.name } }
    assert_redirected_to prd_tag_url(@prd_tag)
  end

  test "should destroy prd_tag" do
    assert_difference('PrdTag.count', -1) do
      delete prd_tag_url(@prd_tag)
    end

    assert_redirected_to prd_tags_url
  end
end
