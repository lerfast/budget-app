# spec/requests/user_authentication_spec.rb

require 'rails_helper'

RSpec.describe "UserAuthentication", type: :request do
  let(:user) { create(:user) }

  describe "POST /users/sign_in" do
    it "signs the user in" do
      post user_session_path, params: { user: { email: user.email, password: user.password } }
      expect(response).to redirect_to(dashboard_path)
    end
  end

  describe "DELETE /users/sign_out" do
    it "signs the user out" do
      delete destroy_user_session_path
      expect(response).to redirect_to(root_path)
    end
  end
end
