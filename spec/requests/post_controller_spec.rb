require 'rails_helper'

RSpec.describe 'PostControllers', type: :request do
  subject { User.create(name: 'Asim Khan', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from UK.') }
  describe 'Posts Index' do
    before(:example) do
      get '/posts/index'
    end

    it 'If response status was correct.' do
      expect(response).to have_http_status(:success)
    end

    it 'Renders the post index template' do
      expect(response).to render_template 'posts/index'
    end

    it 'If the response body includes correct placeholder text of index' do
      expect(response.body).to include('All Posts')
    end
  end

  describe 'GET /show' do
    before(:example) do
      new_post = Post.create(user: subject, title: 'Hello', text: 'This is my first post', likes_counter: 0,
                             comments_counter: 0)
      # get "/users/#{subject.id}/posts/#{new_post.id}"
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
