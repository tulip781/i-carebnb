require 'test_helper'

class UnavailabilitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get unavailabilities_show_url
    assert_response :success
  end

  test "should get index" do
    get unavailabilities_index_url
    assert_response :success
  end

  test "should get edit" do
    get unavailabilities_edit_url
    assert_response :success
  end

  test "should get create" do
    get unavailabilities_create_url
    assert_response :success
  end

  test "should get update" do
    get unavailabilities_update_url
    assert_response :success
  end

  test "should get destroy" do
    get unavailabilities_destroy_url
    assert_response :success
  end

  test "should get new" do
    get unavailabilities_new_url
    assert_response :success
  end

end
