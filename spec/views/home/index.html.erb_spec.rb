require 'rails_helper'

RSpec.describe 'home/index', type: :view do
  it 'displays welcome message' do
    render
    expect(rendered).to include('Welcome to BudgetBuddy')
  end
end
