require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      user = User.new(name: 'Test User', email: 'test@example.com', password: '123456',
                      password_confirmation: '123456')
      expect(user).to be_valid
    end

    it 'is not valid without a name' do
      user = User.new(name: nil)
      expect(user).not_to be_valid
    end
  end
end
