require 'test_helper'

class MasatakaControllerTest < ActionDispatch::IntegrationTest
  test "should get javascript" do
    get masataka_javascript_url
    assert_response :success
  end

  test "should get css" do
  	get masataka_css_url
  	assert_response :success
  end

end
