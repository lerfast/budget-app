require 'rails_helper'

RSpec.feature 'UserSignIns', type: :feature do
  let(:user) { create(:user) }

  scenario 'User signs in successfully' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log In'

  end
end
