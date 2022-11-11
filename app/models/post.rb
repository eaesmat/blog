class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy, foreign_key: :post_id
  has_many :likes, dependent: :destroy, foreign_key: :post_id

  after_create :update_posts_counter

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_five_comments
    comments.includes([:user]).order(created_at: :desc).limit(5)
  end

  private

  def update_posts_counter
    user.increment!(:posts_counter)
  end
end
