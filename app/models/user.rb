class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  def recent_three_posts
    posts.last(3)
  end
end
