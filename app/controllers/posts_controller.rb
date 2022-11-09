class PostsController < ApplicationController
  def index

    @user = User.includes(posts: [:comments]).find(params[:user_id])
    @posts = Post.where(user_id: params[@user.id])
  end

  def show
    @posts = Post.find(params[:id])
  end

  def new
    @id = current_user.id
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = 'Post created successfully'
    else
      flash[:error] = 'Error'
    end
    redirect_to user_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:text)
  end
end
