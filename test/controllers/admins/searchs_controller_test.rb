require 'test_helper'

class Admins::SearchsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_searchs_index_url
    assert_response :success
  end

end
