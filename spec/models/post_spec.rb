# rubocop:disable all
require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    user = User.new(name: 'esmatullah', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                    bio: 'Teacher from UK.', post_counter: 0)
    Post.new(user: user, title: 'Hello', text: 'testing post', likes_counter: 0, comments_counter: 0)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'blank title raises error' do
    subject.title = ''
    expect { subject.save! }.to raise_error(ActiveModel::StrictValidationFailed)
  end

  it 'title is not blank' do
    expect(subject.title).to eq('Hello')
  end

  it 'title is too short' do
    subject.title = 'Hi'
    expect(subject).to_not be_valid
  end

  it 'title is too long' do
    subject.title = 'a' * 255
    expect(subject).to_not be_valid
  end

  it 'comment_counter thats not an integer raises error' do
    subject.comments_counter = 'a'
    expect { subject.save! }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
# rubocop:enable all
