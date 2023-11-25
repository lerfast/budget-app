require 'rails_helper'

RSpec.describe FinancialTransactionsController, type: :controller do
  let(:group) { create(:group) }
  let(:user) { create(:user) }

  let(:valid_attributes) do
    {
      name: 'Transaction',
      amount: 100,
      group_id: group.id
    }
  end

  before do
    user.confirm
    sign_in user
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new FinancialTransaction' do
        expect do
          post :create, params: { financial_transaction: valid_attributes }
        end.to change(FinancialTransaction, :count).by(1)
      end

      it 'redirects to the group page' do
        post :create, params: { financial_transaction: valid_attributes }
        expect(response).to redirect_to(group_path(group))
      end
    end

  end
  describe "GET #edit" do
    let(:transaction) { create(:financial_transaction, user: user) }
  
    it "returns a success response" do
      get :edit, params: { id: transaction.id }
      expect(response).to be_successful
    end
  end
  
  describe "PUT #update" do
    let(:transaction) { create(:financial_transaction, user: user) }
    let(:new_attributes) { { name: "Updated Transaction", amount: 150 } }
  
    it "updates the requested financial transaction" do
      put :update, params: { id: transaction.id, financial_transaction: new_attributes }
      transaction.reload
      expect(transaction.name).to eq("Updated Transaction")
      expect(transaction.amount).to eq(150)
    end
  end
  
  describe "DELETE #destroy" do
    let!(:transaction) { create(:financial_transaction, user: user) }
  
    it "destroys the requested financial transaction" do
      expect {
        delete :destroy, params: { id: transaction.id }
      }.to change(FinancialTransaction, :count).by(-1)
    end
  end
end


