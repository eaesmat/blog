require 'rails_helper'

RSpec.describe 'Posts', type: :system, js: true do
  describe 'show page' do
    before(:example) do
      @user = User.create(name: 'Tom',
                          photo: 'https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                          bio: 'Teacher from Mexico', posts_counter: 0)

      @post1 = Post.create(author: @user, title: 'Timmy Jimmy', text: 'Hey Jimmy jimmy', likes_counter: 0,
                           comments_counter: 0)

      @comment1 = Comment.create(author: @user, post: @post1, text: 'Hi guys')
      @comment2 = Comment.create(author: @user, post: @post1, text: 'hey')
      @comment3 = Comment.create(author: @user, post: @post1, text: 'hey')

      visit user_posts_path(@user, @post1)
    end

    it "I can see the post's title" do
      expect(page).to have_content(@post1.title)
    end

    it "I can see the post's author" do
      expect(page).to have_content(@user.name)
    end

    it 'I can see comments count of the post' do
      expect(page).to have_content(@post1.comments_counter)
    end

    it 'I can see likes count of the post' do
      expect(page).to have_content(@post1.likes_counter)
    end

    it "I can see the post's body" do
      expect(page).to have_content(@post1.text)
    end

    it 'I can see the username of commenter' do
      expect(page).to have_content(@user.name)
    end

    it 'I can see all comments of the post' do
      expect(page).to have_content(@comment1.text)
      expect(page).to have_content(@comment2.text)
      expect(page).to have_content(@comment3.text)
    end
  end
end
