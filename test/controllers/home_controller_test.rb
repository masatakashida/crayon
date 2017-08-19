require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  # -----------------------
  # home#topが表示される	
  # -----------------------
  test "should get top" do
    get home_top_url
    assert_response :success
  end
  # -----------------------
  # home#aboutが表示される
  # -----------------------
  test "should get about" do
    get home_about_url
    assert_response :success
  end

end
