require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:user)
  end

  test "unsucceful edit" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: {
      user: {
        name: " ",
        email: "email@ invalid",
        password: "password",
        password_confirmation: "not_the_same_password"
      }
    }
    assert_template 'users/edit'  
  end

  test "succesful edit" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    name = "user"
    email = "user@user.com"
    patch user_path(@user), params: {
      user: {
        name: name,
        email: email,
        password: "",
        password_confirmation: ""
      }
    }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email
  end

end
