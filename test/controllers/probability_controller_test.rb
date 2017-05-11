require 'test_helper'

class ProbabilityControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get probability_index_url
    assert_response :success
  end

end
