class Group < ApplicationRecord
  ICONS = ['icon1.png', 'icon2.png', 'icon3.png', 'icon4.png', 'icon5.png', 'icon7.png'].freeze
  belongs_to :user
  has_many :financial_transactions, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :user_id }, length: { maximum: 50 }
  validates :icon, presence: true
end
