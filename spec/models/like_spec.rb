require 'rails_helper'

RSpec.describe Like, type: :model do
  subject { Like.new(user_id: 1, post_id: 2) }

  before { subject.save }

  it 'user_id should be present' do
    subject.user_id = 1
    expect(subject).to_not be_valid
  end

  it 'post_id should be present' do
    subject.post_id = 2
    expect(subject).to_not be_valid
  end
end
