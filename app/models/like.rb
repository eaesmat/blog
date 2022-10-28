class Like < ApplicationRecord
  belongs_to :users, class_name: 'User'
  belongs_to :posts, class_name: 'Post'

  def update_likes_counter
    post.increment!(:likes_count)
  end
end
