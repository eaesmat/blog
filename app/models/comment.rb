class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, foreign_key: 'post_id'
  after_save :update_comments_counter
  after_destroy :destroy_comments_counter

  private

  def update_comments_counter
    post.increment!(:comments_counter)
  end

  def destroy_comments_counter
    post.decrement!(:comments_counter)
  end
end
