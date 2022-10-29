require 'rails_helper'

RSpec.describe Like, type: :model do
  subject do
    user = User.new(name: 'John Doe', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                    post_counter: 0)
    post = Post.new(user_id: user, title: 'Hello', text: 'This is my first post', likes_counter: 0, comments_counter: 0)
    Like.new(author: user, post:,)
  end

  it '# likes_counter gets incremented by 1' do
    expect(subject.post.likes_counter) == 1
  end
end
