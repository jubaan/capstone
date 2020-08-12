require 'rails_helper'

RSpec.describe User, type: :controller do
  describe 'Model' do
    let(:user) { build :user }

    it 'User is valid with all params given' do
      expect(user).to be_valid
    end

    it 'User is invalid without name' do
      expect(User.new(name: nil)).to_not be_valid
    end

    it 'User is invalid without email' do
      expect(User.new(email: nil)).to_not be_valid
    end

    it 'User is invalid without password' do
      expect(User.new(password: nil)).to_not be_valid
    end
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_length_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_length_of(:password) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:expenses) }
  end
end
