require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Validations' do
    subject { Like.new(author_id: 3, post_id: 4) }

    before { subject.save }

    it 'Author id should be an integer' do
      subject.author_id = 'z'
      expect(subject).to_not be_valid
    end

    it 'Post id should be an integer' do
      subject.post_id = 'y'
      expect(subject).to_not be_valid
    end
  end
end
