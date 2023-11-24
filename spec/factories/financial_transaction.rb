FactoryBot.define do
    factory :financial_transaction do
      name { "Transaction" }
      amount { 100 }
      association :group
      association :user
    end
  end
  