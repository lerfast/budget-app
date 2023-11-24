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
end
