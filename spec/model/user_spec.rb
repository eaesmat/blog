require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    subject { User.new(name: 'KJC', photo: 'http://google.com', bio: 'Hello Internet! I am KJC.') }
    before { subject.save }

    it 'Name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'Bio should be present' do
      subject.bio = nil
      expect(subject).to_not be_valid
    end

    it 'User should have post greater than or equal to 0' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end

    it 'User should have post greater than or equal to 0' do
      subject.posts_counter = 0
      expect(subject).to be_valid
    end
  end

  describe 'Should test recent post method' do
    before { 4.times { |post_nb| Post.create(author_id: subject.id, title: "This is post #{post_nb}") } }

    it 'User should have three recent posts' do
      expect(subject.most_recent_posts).to eq(subject.posts.last(3))
    end
  end
end
