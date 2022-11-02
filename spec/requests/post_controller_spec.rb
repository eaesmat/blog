require 'rails_helper'

RSpec.describe 'PostControllers', type: :request do
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
end
