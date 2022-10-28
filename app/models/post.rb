class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :user, class_name: 'User'

  def update_posts_counter
    user.increment!(:post_counter)
  end

  def recent_five_comments
    comments.last(5)
  end
end
