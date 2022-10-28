# rubocop:disable all

require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'esmatulah', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'for test .', post_counter: 0) }

  before { subject.save }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'post_counter is an integer' do
    Post.new do |post|
      post.title = 'Hello World'
      post.text = 'This is my first post'
      post.user_id = subject.id
      post.save
    end
    expect(subject.post_counter).to be_an(Integer)
  end

  it 'blank name raises error' do
    subject.name = ''
    expect { subject.save! }.to raise_error(ActiveModel::StrictValidationFailed)
  end

  it 'post_counter thats not an integer raises error' do
    subject.post_counter = 'a'
    expect { subject.save! }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
# rubocop:enable all
