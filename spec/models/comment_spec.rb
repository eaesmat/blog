require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Validations' do
    subject { Comment.new(text: 'This is just a test', user_id: 2, post_id: 3) }

    before { subject.save }

    it 'Title should not be valid' do
      subject.text = nil
      expect(subject).to_not be_valid
    end

    it 'Author id should be a number' do
      subject.user_id = 'a'
      expect(subject).to_not be_valid
    end

    it 'Post id should be a number' do
      subject.post_id = 'look'
      expect(subject).to_not be_valid
    end
  end
end
