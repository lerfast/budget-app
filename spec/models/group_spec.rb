require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'validations' do
    let(:user) { User.create(name: 'Test User', email: 'test@example.com', password: 'password') }

    it 'is valid with valid attributes' do
      group = user.groups.build(name: 'Test Group', icon: 'test_icon.png')
      expect(group).to be_valid
    end

    it 'is not valid without a name' do
      group = user.groups.build(name: nil, icon: 'test_icon.png')
      expect(group).not_to be_valid
    end

    it 'is not valid without an icon' do
      group = user.groups.build(name: 'Test Group', icon: nil)
      expect(group).not_to be_valid
    end

    it 'is not valid with a name longer than 50 characters' do
      group = user.groups.build(name: 'a' * 51, icon: 'test_icon.png')
      expect(group).not_to be_valid
    end

    it 'is not valid with a non-unique name for the same user' do
      user.groups.create(name: 'Unique Name', icon: 'test_icon.png')
      duplicate_group = user.groups.build(name: 'Unique Name', icon: 'test_icon.png')
      expect(duplicate_group).not_to be_valid
    end
  end
end
