require "test_helper"

class StoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get stories_top_url
    assert_response :success
  end
end
