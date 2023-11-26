class CreateFinancialTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :financial_transactions do |t|
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.string :name, null: false
      t.decimal :amount, null: false
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
