require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase
  def setup
    @relationship = Relationship.new(follower_id: users(:user).id, followed_id: users(:other_user).id)
  end

  test "sould be valid" do
    assert @relationship.valid?
  end

  test "should require a follower_id" do
    @relationsip.follower_id = nil
    assert_not @relationship.valid?
  end

  test "should require a followed_id" do
    @relationsip.followed_id = nil
    assert @relationship.valid?
  end
end
