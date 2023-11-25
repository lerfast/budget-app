require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  let(:user) { create(:user, password: 'password') }

  before do
    post user_session_path, params: { user: { email: user.email, password: 'password' } }
  end

  describe 'POST /groups' do
    let(:valid_params) { { group: { name: 'New Group', icon: 'icon.png' } } }

    it 'creates a new Group' do
      expect {
        post groups_path, params: valid_params
      }.to change(Group, :count).by(1)
    end
  end

  describe 'PUT /groups/:id' do
    let(:group) { create(:group, user: user) }
    let(:updated_params) { { group: { name: 'Updated Group', icon: 'updated_icon.png' } } }

    it 'updates the requested group' do
      put group_path(group), params: updated_params
      group.reload
      expect(group.name).to eq('Updated Group')
      expect(group.icon).to eq('updated_icon.png')
    end
  end

  describe 'DELETE /groups/:id' do
    let!(:group) { create(:group, user: user) }

    it 'destroys the requested group' do
      expect {
        delete group_path(group)
      }.to change(Group, :count).by(-1)
    end
  end
end
