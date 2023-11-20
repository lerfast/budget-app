# spec/models/financial_transaction_spec.rb
require 'rails_helper'

RSpec.describe FinancialTransaction, type: :model do
  let(:user) { User.create(name: 'Test User', email: 'test@example.com', password: 'password') }
  let(:group) { Group.create(name: 'Test Group', icon: 'test_icon.png', user:) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      transaction = group.financial_transactions.build(name: 'Transaction', amount: 100, user:)
      expect(transaction).to be_valid
    end

    it 'is not valid without a name' do
      transaction = group.financial_transactions.build(name: nil, amount: 100, user:)
      expect(transaction).not_to be_valid
    end

    it 'is not valid with a name longer than 100 characters' do
      transaction = group.financial_transactions.build(name: 'a' * 101, amount: 100, user:)
      expect(transaction).not_to be_valid
    end

    it 'is not valid without an amount' do
      transaction = group.financial_transactions.build(name: 'Transaction', amount: nil, user:)
      expect(transaction).not_to be_valid
    end

    it 'is not valid with an amount less than or equal to 0' do
      transaction = group.financial_transactions.build(name: 'Transaction', amount: -1, user:)
      expect(transaction).not_to be_valid
    end
  end
end
