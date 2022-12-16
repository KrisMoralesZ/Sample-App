require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase
  def setup
    @relationsip = Relationship.new(follower_id: users(:user).id, folowed_id: users(:other_user).id)
  end

  test "sould be valid" do
    assert @relationsip.valid?
  end

  test "should require a follower_id" do
    @relationsip.follower_id = nil
    assert_not @relationsip.valid?
  end

  test "should require a followed_id" do
    @relationsip.followed_id = nil
    assert @relationsip.valid?
  end
end
