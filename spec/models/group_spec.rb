# spec/models/group_spec.rb
require 'rails_helper'

RSpec.describe Group, type: :model do
  it { is_expected.to belong_to(:user) }
  it { should have_many(:financial_transactions).dependent(:destroy) }
  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_most(50) }
  it { should validate_presence_of(:icon) }
end
