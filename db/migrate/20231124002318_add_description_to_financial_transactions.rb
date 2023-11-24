class AddDescriptionToFinancialTransactions < ActiveRecord::Migration[7.1]
  def change
    add_column :financial_transactions, :description, :string
  end
end
