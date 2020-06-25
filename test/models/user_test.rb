require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save user without username" do
    user = User.new
    user.email = "fake@email.com"
    user.password = "a_password"
    user.password_confirmation = "a_password"
    assert_not user.save
  end

  test "should not save user without email" do
    user = User.new
    user.username = "my_user"
    user.password = "a_password"
    user.password_confirmation = "a_password"
    assert_not user.save
  end

  test "should not save user without valid email" do
    user = User.new
    user.username = "my_user"
    user.email = "invalid_email"
    user.password = "a_password"
    user.password_confirmation = "a_password"
    assert_not user.save
  end

  test "should not save user without password" do
    user = User.new
    user.username = "my_user"
    user.email = "fake@email.com"
    assert_not user.save
  end

  test "should not save user with wrong password confirmation" do
    user = User.new
    user.username = "my_user"
    user.email = "fake@email.com"
    user.password = "a_password"
    user.password_confirmation = "wrong_confirmation"
    assert_not user.save
  end

  test "should not authenticate with wrong password" do
    user = User.new
    user.username = "my_user"
    user.email = "fake@email.com"
    user.password = "a_password"
    user.password_confirmation = "a_password"
    user.save
    assert_not User.find_by(username: "my_user").try(:authenticate, 'wrong_password')
  end
end
