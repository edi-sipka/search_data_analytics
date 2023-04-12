require 'rails_helper'

RSpec.describe Search, type: :model do
  describe 'testing search model' do
    subject { described_class.new(query: 'Future', user: User.new(ip_address: '127.0.0.3000')) }

    it 'valid model attributes' do
      expect(subject).to be_valid
    end

    it 'need to have query' do
      subject.query = nil
      expect(subject).to_not be_valid
      expect(subject.errors[:query]).to be_present
    end

    it 'must have a query with minimum length' do
      subject.query = 'z' * 1
      expect(subject).to_not be_valid
      expect(subject.errors[:query]).to be_present
    end

    it 'must not have a query with maximum length' do
      subject.query = 'z' * 51
      expect(subject).to_not be_valid
      expect(subject.errors[:query]).to be_present
    end

    it 'must have a user' do
      subject.user = nil
      expect(subject).to_not be_valid
      expect(subject.errors[:user]).to be_present
    end
  end
end