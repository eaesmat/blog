require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(user_id: 1, text: 'Thy Strength befits the Crown') }

  before { subject.save }

  it 'user_id should be present' do
    subject.user_id = 1
    expect(subject).to_not be_valid
  end

  it 'text should be present' do
    subject.text = 'Thy Strength befits the Crown'
    expect(subject).to_not be_valid
  end
end
