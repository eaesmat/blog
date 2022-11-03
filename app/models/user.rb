class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes
  validates :name, presence: { strict: true }
  validates :post_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_three_posts
    posts.order(created_at: 'desc').limit(3)
  end
end
