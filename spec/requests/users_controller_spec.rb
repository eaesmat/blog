require 'rails_helper'

RSpec.describe 'UsersControllers', type: :request do
  describe 'User Index' do
    before(:example) do
      get '/users'
    end

    it 'responds success of index request' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'response body includes correct placeholders' do
      expect(response.body).to include('All Users')
    end
  end

  describe 'User Show ' do
    before(:example) do
      user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
      get "/users/#{user.id}"
    end
    it 'responds success of show request' do
      expect(response).to have_http_status(:success)
    end
  end
end
