require 'rails_helper'

RSpec.feature 'EditGroup', type: :feature do
  let(:user) { create(:user) }
  let!(:group) { create(:group, user: user) }

  scenario 'User edits a group' do
    # Simula el inicio de sesión
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log In'  # Asegúrate de que este es el texto exacto del botón en tu formulario

    visit edit_group_path(group)
    fill_in 'Name', with: 'Updated Group Name'  # Asegúrate de que este es el identificador correcto
    # Completa cualquier otro campo necesario en el formulario

    click_button 'Save'  # Asegúrate de que este es el texto exacto del botón en tu formulario

   
  end
end
