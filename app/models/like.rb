class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, foreign_key: 'post_id'
  after_save :update_likes_counter
  after_destroy :destroy_likes_counter

  private

  def update_likes_counter
    post.increment!(:likes_counter)
  end

  def destroy_likes_counter
    post.decrement!(:likes_counter)
  end
end
