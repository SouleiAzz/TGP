require 'test_helper'

class DynamicControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dynamic_index_url
    assert_response :success
  end

end
