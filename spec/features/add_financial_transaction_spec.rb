require 'rails_helper'

RSpec.feature 'AddFinancialTransaction', type: :feature do
  let(:user) { create(:user) }
  let(:group) { create(:group, user: user) }

  scenario 'User adds a new financial transaction' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log In'  # Asegúrate de que este es el texto exacto del botón en tu formulario

    visit new_financial_transaction_path
    fill_in 'Name', with: 'New Transaction'
    fill_in 'Amount', with: '100'
    # El ID del grupo se establece de forma oculta, no hay selección directa en el formulario

    click_button 'Save Transaction'

   
  end
end
