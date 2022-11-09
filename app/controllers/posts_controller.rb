class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.includes(comments: [:author]).find(params[:id])
  end

  def new
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
