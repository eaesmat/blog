class Api::PostsController < ApplicationController
  before_action :authenticate_request
  def index
    @posts = Post.where(author_id: params[:user_id])
    if @posts.empty?
      json_response({ msg: "No Posts found for user #{params[:user_id]}" }, 400)
    else
      render json: @posts
    end
  end
end
