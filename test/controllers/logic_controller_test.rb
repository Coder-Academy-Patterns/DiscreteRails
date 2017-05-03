require 'test_helper'

class LogicControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get logic_index_url
    assert_response :success
  end

end
