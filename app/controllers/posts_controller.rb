class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @user = User.find(params[:user_id])
    @pagy, @posts = pagy(@user.posts.order(created_at: :desc), items: 3)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.new(post_params)
    @post.comments_counter = 0
    @post.likes_counter = 0
    respond_to do |format|
      format.html do
        if @post.save
          flash[:success] = 'Post created successfully'
          redirect_to user_posts_path(@user)
        else
          flash[:error] = 'Post not created'
          render :new
        end
      end
    end
  end

  def destroy
    post = Post.find(params[:id])
    user = User.find(post.user_id)
    user.posts_counter -= 1
    post.destroy
    user.save
    flash[:success] = 'You have deleted this post!'
    redirect_to user_posts_path(user)
  end

  private

  def post_params
    params.require(:new_post).permit(:title, :text, :likes_counter, :comments_counter)
  end
end
