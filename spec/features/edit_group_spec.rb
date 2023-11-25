require 'rails_helper'

RSpec.feature 'EditGroup', type: :feature do
  let(:user) { create(:user) }
  let!(:group) { create(:group, user:) }

  scenario 'User edits a group' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log In'

    visit edit_group_path(group)
    fill_in 'Name', with: 'Updated Group Name'


    click_button 'Save'
  end
end
