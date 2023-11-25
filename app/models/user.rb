class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :financial_transactions, foreign_key: 'author_id'
  has_many :groups

  validates :name, presence: true
end
