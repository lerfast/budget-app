require 'rails_helper'

RSpec.describe 'financial_transactions/new', type: :view do
  before do
    group = create(:group, icon: 'existing_icon.png')
    assign(:transaction, FinancialTransaction.new(group:))
  end

  it 'renders the new transaction form' do
    render
    expect(rendered).to have_selector('form')
  end
end
