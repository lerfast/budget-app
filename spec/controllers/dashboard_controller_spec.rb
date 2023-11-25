require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  let(:user) { create(:user) }

  before do
    sign_in user

    create_list(:group, 5, user:)
    create_list(:financial_transaction, 5, user:)
    get :index
  end

  describe 'GET #index' do
    it 'returns a success response' do
      expect(response).to be_successful
    end

    it "loads all of the user's groups and transactions" do
      expect(assigns(:groups).size).to eq(5)
      expect(assigns(:transactions).size).to eq(5)
    end
  end
end
