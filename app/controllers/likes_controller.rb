class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    like = Like.new
    like.user = current_user
    like.post = post
    if like.save
      flash[:success] = 'Like created successfully'
    else
      flash[:error] = 'Like not created'
    end
    redirect_to user_post_path(current_user, post)
  end
end
