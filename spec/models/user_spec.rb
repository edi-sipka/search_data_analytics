require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'testing user model' do
    before(:each) do
      User.destroy_all
    end

    let(:subject) { described_class.new(ip_address: '127.0.0.3000') }

    it 'valid user attributes' do
        expect(subject).to be_valid
      end

    it 'must have ip address' do
      subject.ip_address = nil
      expect(subject).to_not be_valid
    end

    it 'saves the user to the database' do
      expect { subject.save }.to change { User.count }.by(1)
    end

    it 'has a created_at timestamp after saving' do
      subject.save
      expect(subject.created_at).to_not be_nil
    end
  end
end