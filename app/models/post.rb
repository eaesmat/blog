class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :user, class_name: 'User'

  validates :title, presence: { strict: true }, length: { minimum: 3, maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_post_counter

  def update_posts_counter
    user.increment!(:post_counter)
  end

  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
