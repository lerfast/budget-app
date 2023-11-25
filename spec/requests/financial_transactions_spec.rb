require 'rails_helper'

RSpec.describe 'FinancialTransactions', type: :request do
  let(:user) { create(:user, password: 'password') }
  let(:group) { create(:group, user:) }

  before do
    post user_session_path, params: { user: { email: user.email, password: 'password' } }
  end

  describe 'POST /financial_transactions' do
    let(:valid_params) { { financial_transaction: { name: 'New Transaction', amount: 100, group_id: group.id } } }

    it 'creates a new financial transaction' do
      expect do
        post financial_transactions_path, params: valid_params
      end.to change(FinancialTransaction, :count).by(1)
    end

    it 'redirects to the group page' do
      post financial_transactions_path, params: valid_params
      expect(response).to redirect_to(group_path(group))
    end
  end

  describe 'PUT /financial_transactions/:id' do
    let(:transaction) { create(:financial_transaction, user:, group:) }
    let(:updated_params) { { financial_transaction: { name: 'Updated Transaction', amount: 200 } } }

    it 'updates the requested financial transaction' do
      put financial_transaction_path(transaction), params: updated_params
      transaction.reload
      expect(transaction.name).to eq('Updated Transaction')
      expect(transaction.amount).to eq(200)
    end
  end

  describe 'DELETE /financial_transactions/:id' do
    let!(:transaction) { create(:financial_transaction, user:, group:) }

    it 'destroys the requested financial transaction' do
      expect do
        delete financial_transaction_path(transaction)
      end.to change(FinancialTransaction, :count).by(-1)
    end
  end
end
