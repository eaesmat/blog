class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :posts, dependent: :destroy, foreign_key: :user_id
  has_many :comments, dependent: :destroy, foreign_key: :user_id
  has_many :likes, dependent: :destroy, foreign_key: :user_id

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # Compare this snippet from app\models\post.rb:
  def recent_three_posts
    posts.order(created_at: :desc).limit(3)
  end

  def admin?
    role == 'admin'
  end
end
