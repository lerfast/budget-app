require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  let(:user) { create(:user) }

  before do
    user.confirm if user.respond_to?(:confirm)
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      group = create(:group, user:)
      get :show, params: { id: group.id }
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      group = create(:group, user:)
      get :edit, params: { id: group.id }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Group' do
        expect do
          post :create, params: { group: { name: 'New Group', icon: 'new_icon.png' } }
        end.to change(Group, :count).by(1)
      end

      it 'redirects to the groups list' do
        post :create, params: { group: attributes_for(:group) }
        expect(response).to redirect_to(groups_path)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { { name: 'Updated Group' } }

      it 'updates the requested group' do
        group = create(:group, user:)
        put :update, params: { id: group.id, group: new_attributes }
        group.reload
        expect(group.name).to eq('Updated Group')
      end

      it 'redirects to the created group' do
        post :create, params: { group: attributes_for(:group) }
        expect(response).to redirect_to(groups_path)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested group' do
      group = create(:group, user:)
      expect do
        delete :destroy, params: { id: group.id }
      end.to change(Group, :count).by(-1)
    end

    it 'redirects to the groups list' do
      group = create(:group, user:)
      delete :destroy, params: { id: group.id }
      expect(response).to redirect_to(groups_path)
    end
  end
end
