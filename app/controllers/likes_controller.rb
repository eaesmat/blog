class LikesController < ApplicationController
  load_and_authorize_resource

  def create
    @post = Post.find(params[:post_id])
    new_like = current_user.likes.new(author_id: current_user.id, post_id: @post.id)
    if new_like.save
      redirect_to "/users/#{@post.author_id}/posts/#{@post.id}", notice: 'Success Like Saved!'
    else
      redirect_to "/users/#{@post.author_id}/posts/#{@post.id}", notice: 'Error Occured for Like'
    end
  end

  def destroy
    like = @post.likes.find(params[:id])
    like.destroy
    redirect_to "/users/#{@post.author_id}/posts/#{@post.id}", notice: 'Like removed'
  end
end
