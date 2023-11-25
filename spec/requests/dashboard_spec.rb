require 'rails_helper'

RSpec.describe 'Dashboard', type: :request do
  let(:user) { create(:user, password: 'password') }

  before do
    post user_session_path, params: { user: { email: user.email, password: 'password' } }
  end

  describe 'GET /dashboard' do
    it 'returns a success response' do
      get dashboard_path
      expect(response).to have_http_status(:success)
    end
  end
end
