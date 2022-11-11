require 'rails_helper'

RSpec.describe 'Users', type: :system, js: true do
  describe 'users show page' do
    before(:example) do
      @user = User.create(name: 'Tom',
                          photo: 'https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                          bio: 'Teacher from Mexico', posts_counter: 0)

      @post1 = Post.create(author: @user, title: 'Timmy Jimmy', text: 'Hey Jimmy jimmy', likes_counter: 0,
                           comments_counter: 0)

      @post2 = Post.create(author: @user, title: 'Alan Luqman', text: 'This is awesome', likes_counter: 0,
                           comments_counter: 0)
      @post3 = Post.create(author: @user, title: 'Alan', text: 'Great guy', likes_counter: 0,
                           comments_counter: 0)

      visit user_path(@user)
    end

    it "I can see the user's profile picture" do
      find("img[src='#{@user.photo}']")
    end

    it "I can see the user's username" do
      expect(page).to have_content(@user.name)
    end

    it "I can see the user's post count" do
      expect(page).to have_content(@user.posts_counter)
    end

    it "I can see the user's bio" do
      expect(page).to have_content(@user.bio)
    end

    it "I can see the user's last 3 posts" do
      expect(page).to have_content(@post1.title)
      expect(page).to have_content(@post2.title)
      expect(page).to have_content(@post3.title)
    end

    it 'I can see a button to redirect to posts page' do
      expect(page).to have_content('See all Posts')
    end

    it "I can see the user's posts index page" do
      click_link 'See all Posts'
      expect(page).to have_current_path(user_posts_path(@user))
    end
  end
end
