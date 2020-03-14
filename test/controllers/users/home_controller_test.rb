require 'test_helper'

class Users::HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get users_home_top_url
    assert_response :success
  end

  test "should get about" do
    get users_home_about_url
    assert_response :success
  end

  test "should get glossary" do
    get users_home_glossary_url
    assert_response :success
  end

  test "should get ranking" do
    get users_home_ranking_url
    assert_response :success
  end

end
