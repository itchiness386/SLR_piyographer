require 'test_helper'

class Users::SearchsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_searchs_index_url
    assert_response :success
  end

end
