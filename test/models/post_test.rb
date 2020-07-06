require 'test_helper'

class PostTest < ActiveSupport::TestCase

  def setup
    @user = users(:lucas)
    @post = Post.new(content: 'Contenido del post', user_id: @user.id)
  end

  test 'should be valid' do
    assert @post.valid?
  end

  test 'user id should be present' do
    @post.user_id = nil
    assert_not @post.valid?
  end

  test 'content should be present' do
    @post.content = ' '
    assert_not @post.valid?
  end

  test 'content max 140 characters' do
    @post.content = 'a' * 141
    assert_not @post.valid?
  end


end
