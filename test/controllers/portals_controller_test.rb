require 'test_helper'

class PortalsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get portals_index_url
    assert_response :success
  end

  test "should get new" do
    get portals_new_url
    assert_response :success
  end

end
