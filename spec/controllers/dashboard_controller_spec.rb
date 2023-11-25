# spec/controllers/dashboard_controller_spec.rb

require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  let(:user) { create(:user) }

  before do
    sign_in user
    # Imprime para verificar que el usuario está creado
    puts "User created: #{user.inspect}"

    create_list(:group, 5, user: user)
    create_list(:financial_transaction, 5, user: user)
    get :index
  end

  describe "GET #index" do
    it "returns a success response" do
          expect(response).to be_successful
    end

    it "loads all of the user's groups and transactions" do
     
      expect(assigns(:groups).size).to eq(5)
      expect(assigns(:transactions).size).to eq(5)
    end
  end
end
