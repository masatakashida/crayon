require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
# ----------------------------
# users#new ページに入れるかテスト
# ----------------------------
  test "should get new" do
    get new_user_path
    assert_response :success
  end

end
