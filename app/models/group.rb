class Group < ApplicationRecord
    belongs_to :user
    has_many :financial_transactions
  
    validates :name, presence: true, uniqueness: { scope: :user_id }, length: { maximum: 50 }
    validates :icon, presence: true
  end
  