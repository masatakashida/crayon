require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
# ----------------------------
# users#new ページに入れるかテスト
# ----------------------------
  test "should get new" do
    get users_new_url
    assert_response :success
  end

end
