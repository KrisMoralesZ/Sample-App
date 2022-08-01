require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_no_diference "User.count" do
      post users_path, params: { user: {name: "",
        email: "user@invalid",
        password: "pass",
        password_confiormation: "word"}}
    end
    assert_template "user/new"
  end
end
