require 'rails_helper'

RSpec.describe 'Users', type: :system, js: true do
  describe 'users index page' do
    before(:example) do
      @user = User.create(name: 'Tom',
                          photo: 'https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                          bio: 'I am software engineer', posts_counter: 0)
      visit users_path
    end

    it 'I can see the names of all users' do
      expect(page).to have_content(@user.name)
    end

    it "I can see the user's profile picture" do
      find("img[src='#{@user.photo}']")
    end

    it 'I can see the number of posts for each user' do
      expect(page).to have_content(@user.posts_counter)
    end

    it "I can see the user's page" do
      click_link @user.name
      expect(page).to have_current_path(user_path(@user))
    end
  end
end
