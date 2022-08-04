require "test_helper"

class LikeTest < ActiveSupport::TestCase
  def setup
    @like = Like.new user: users(:gustavo), comic_id: 123
  end

  test "valid with user and comic_id" do
    assert @like.valid?
  end

  test "invalid without user" do
    @like.user = nil
    refute @like.valid?, "like is valid without user_id"
    assert_not_nil @like.errors[:user_id], "no validation error for user present"
  end

  test "invalid without comic_id" do
    @like.comic_id = nil
    refute @like.valid?, "like is valid without comic_id"
    assert_not_nil @like.errors[:comics_id], "no validation error for comic_id present"
  end
end
