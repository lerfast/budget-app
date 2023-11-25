require 'rails_helper'

RSpec.feature 'DeleteGroup', type: :feature do
  let(:user) { create(:user) }
  let!(:group) { create(:group, user: user) }

  scenario 'User deletes a group' do
    # Simula el inicio de sesión
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log In'  # Asegúrate de que este es el texto exacto del botón en tu formulario

    visit groups_path
    # Buscar y hacer clic en el botón 'Delete' para el grupo específico
    within(".category-container", text: group.name) do
      click_button 'Delete'
    end

    # Asegúrate de que se muestra el mensaje de confirmación
    
  end
end
