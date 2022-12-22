require 'test_helper'

class MicropostsInterfaceTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:user)
  end

  test "micropost interface" do
    log_in_as(@user)
    get root_path
    assert_select 'div.pagination'

    #Invalid submision
    post microposts_path, params: { micropost: { content: "" } }
    assert_select 'div#error_explanation'
    assert_select 'a[href=?]', '/?page=2'

    #Valid submision
    content = "This micropost really ties the room together"
    post microposts_path, params: {micropost: { content: content } }
    assert_redirected_to root_url
    follow_redirect!
    assert_match content, response.body
    
    #Delete Post
    assert_select "a", 'delete'
    first_micropost = @user.microposts.paginate(page: 1).first
    assert_difference 'Micropost.count', -1 do
      delete micropost_path(first_micropost)
    end
    
  end
  
end
