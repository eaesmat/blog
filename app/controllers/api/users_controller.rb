class Api::UsersController < ApplicationController
  # before_action :authenticate_request
  def index
    @users = User.all
    render json: @users, status: :ok
  end
end
