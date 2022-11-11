require 'rails_helper'

RSpec.describe PostsController, type: :request do
  subject { User.create(name: 'Asim Khan', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from UK.', posts_counter: 0) }

  describe 'GET /index' do
    before(:example) do
      get "/users/#{subject.id}/posts"
    end

    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders post index success' do
      expect(response).to render_template(:index)
    end

    it 'render index should include ' do
      expect(response.body).to include("List of all Posts by #{subject.name}")
    end
  end

  describe 'GET /show' do
    before(:example) do
      new_post = Post.create(author: subject, title: 'Hello', text: 'This is my first post', likes_counter: 0,
                             comments_counter: 0)
      get "/users/#{subject.id}/posts/#{new_post.id}"
    end

    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders post show success' do
      expect(response).to render_template(:show)
    end

    it 'render index should include ' do
      expect(response.body).to include('Post Details')
    end
  end
end
