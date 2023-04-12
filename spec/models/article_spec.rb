require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'testing article model' do
    subject { described_class.new(title: 'Article') }

    it 'valid article attributes' do
      expect(subject).to be_valid
    end

    it 'must have a title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'must have a title with minimum length' do
      subject.title = ''
      expect(subject).to_not be_valid
    end

    it 'must not have a title with maximum length' do
      subject.title = 'z' * 101
      expect(subject).to_not be_valid
    end
  end
end
