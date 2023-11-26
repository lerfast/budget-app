require 'rails_helper'

RSpec.feature 'DeleteGroup', type: :feature do
  let(:user) { create(:user) }
  let!(:group) { create(:group, user:) }

  scenario 'User deletes a group' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log In'

    visit groups_path
    within('.category-container', text: group.name) do
      click_button 'Delete'
    end
  end
end
