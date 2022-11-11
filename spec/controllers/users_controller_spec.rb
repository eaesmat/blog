require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET#index' do
    before(:example) do
      get '/users'
    end

    it 'responds success' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the list of users' do
      expect(response).to render_template(:index)
    end

    it 'renders the correct placeholder' do
      expect(response.body).to include('List of Users')
    end
  end

  describe 'GET#show' do
    before(:example) do
      user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                         posts_counter: 0)
      get "/users/#{user.id}"
    end

    it 'gets the user' do
      expect(response).to have_http_status(:ok)
    end

    it 'show the list' do
      expect(response).to render_template(:show)
    end

    it 'shows the user data' do
      expect(response.body).to include('User Details')
    end
  end
end
