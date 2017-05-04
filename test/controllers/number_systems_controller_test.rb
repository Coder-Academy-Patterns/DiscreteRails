require 'test_helper'

class NumberSystemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get number_systems_index_url
    assert_response :success
  end

end
