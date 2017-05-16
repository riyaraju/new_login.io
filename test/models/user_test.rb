require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "should not save user without username" do
    user = User.new
    assert_not user.save
  end

  test "regex should be match" do
    assert_match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, 'riya.raju@mobme.in')
  end

end
