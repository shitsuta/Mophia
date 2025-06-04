require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "show assigns the requested user's posts" do
    user1 = User.create!(email: 'user1@example.com', password: 'password', nickname: 'u1')
    user2 = User.create!(email: 'user2@example.com', password: 'password', nickname: 'u2')

    post1 = Post.create!(title: 'First', text: 'text', movie_link: '', user: user1)
    Post.create!(title: 'Other', text: 'text', movie_link: '', user: user2)

    get :show, params: { id: user1.id }

    assert_equal user1.nickname, assigns(:nickname)
    assert_includes assigns(:posts), post1
    assert_equal 1, assigns(:posts).count
  end
end
