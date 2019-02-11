require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "Invalid signup" do
    get signup_path
    assert_no_difference 'User.count' do
      post create_user_path, params: { user: { username: "", password: "foo", password_confirmation: "bar"}}
    end
  end
  test "Valid signup" do
    get signup_path
    assert_difference 'User.count', 1 do
      post create_user_path, params: { user: { username: "Carl", password: "password", password_confirmation: "password"}}
    end
  end
end
