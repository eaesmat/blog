require 'rails_helper'

RSpec.describe 'Users Index Page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Oyinlade Ojesanmi', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                        bio: 'I am a Full-stack developer', posts_counter: 6)
    @user2 = User.create(name: 'Nicholas Emmanuel', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                         bio: 'I am a software developer', posts_counter: 9)
  end
  scenario 'displays all users username' do
    visit '/'
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@user2.name)
  end

  scenario 'displays all users profile photo' do
    visit user_path(id: @user.id)
    visit user_path(id: @user2.id)
    find("img[src='https://unsplash.com/photos/F_-0BxGuVvo']")
    find("img[src='https://unsplash.com/photos/F_-0BxGuVvo']")
  end

  scenario 'displays number of posts' do
    visit '/'
    expect(page).to have_content(@user.posts_counter)
  end

  scenario 'renders the user show page' do
    visit '/'
    click_link(@user.name)
    expect(page).to have_content(@user.name)
  end
end
