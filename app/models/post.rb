class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, dependent: :destroy, foreign_key: 'post_id'
  has_many :likes, dependent: :destroy, foreign_key: 'post_id'
  after_save :update_posts_counter
  after_destroy :delete_posts_counter
  after_initialize :init

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, :likes_counter, numericality: { greater_than_or_equal_to: 0 }
  validates :likes_counter, comparison: { greater_than_or_equal_to: 0 }, numericality: { only_integer: true }

  def most_recent_comments
    comments.includes([:author]).order(created_at: :desc).limit(5)
  end

  private

  def update_posts_counter
    author.increment!(:posts_counter)
  end

  def delete_posts_counter
    author.decrement!(:posts_counter)
  end

  def init
    self.comments_counter ||= 0
    self.likes_counter ||= 0
  end
end
