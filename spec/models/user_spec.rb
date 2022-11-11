require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name should not be too short' do
    subject.name = 'a'
    expect(subject).to_not be_valid
  end

  it 'name should not be too long' do
    subject.name = 'a' * 51
    expect(subject).to_not be_valid
  end

  it 'posts_counter should not be string' do
    subject.posts_counter = 'abc'
    expect(subject).to_not be_valid
  end

  it 'posts_counter should not be negative value' do
    subject.posts_counter = -2
    expect(subject).to_not be_valid
  end
end
