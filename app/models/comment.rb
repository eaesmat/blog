class Comment < ApplicationRecord
  belongs_to :users, class_name: 'User'
  belongs_to :posts, class_name: 'Post'

  after_save :update_comments_counter

  def update_comments_counter
    post.increment!(:comments_count)
  end
end
