require 'rails_helper'

RSpec.describe FinancialTransaction, type: :model do
  it { is_expected.to belong_to(:user).with_foreign_key('author_id') }

  it { is_expected.to belong_to(:group) }

  it { is_expected.to validate_presence_of(:name) }
end
