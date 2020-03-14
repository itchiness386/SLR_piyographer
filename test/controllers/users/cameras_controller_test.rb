require 'test_helper'

class Users::CamerasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_cameras_index_url
    assert_response :success
  end

  test "should get edit" do
    get users_cameras_edit_url
    assert_response :success
  end

end
