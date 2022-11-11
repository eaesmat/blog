require 'rails_helper'

RSpec.describe 'Renders the post show page', type: :feature do
  before :each do
    @user = User.create(name: 'Nicholas Emmanuel', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                        bio: 'I am a software developer.', posts_counter: 9)
    @first_post = Post.create(title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0,
                              user_id: @user.id)
    5.times do |_i|
      Comment.create(text: 'Nice post!!', user_id: @user.id, post_id: @first_post.id)
    end
    visit user_post_path(@first_post.user, @first_post)
  end

  scenario 'displays the post title' do
    expect(page).to have_content(@first_post.title)
  end

  scenario 'disolays number of comments' do
    expect(page).to have_content('Comments: 5')
  end

  scenario 'displays number of likes' do
    expect(page).to have_content('Likes: 0')
  end

  scenario 'displays the content of the post' do
    expect(page).to have_content(@first_post.text)
  end

  scenario 'displays comments' do
    expect(page).to have_content('Hello')
  end

  scenario 'displays can see the username of each commentor' do
    expect(page).to have_content(@user.name)
  end

  scenario 'I can see the comment each commentor left.' do
    expect(page).to have_content('Nice post!!')
  end
end
