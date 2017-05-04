require 'test_helper'

class HashControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hash_index_url
    assert_response :success
  end

end
