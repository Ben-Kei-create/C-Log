require "test_helper"

class MoviesControllerTest < ActionDispatch::IntegrationTest
  test "should get public/search" do
    get movies_public/search_url
    assert_response :success
  end

  test "should get show" do
    get movies_show_url
    assert_response :success
  end
end
