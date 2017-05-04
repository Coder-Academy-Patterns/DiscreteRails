require 'test_helper'

class SearchEfficiencyControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get search_efficiency_index_url
    assert_response :success
  end

end
