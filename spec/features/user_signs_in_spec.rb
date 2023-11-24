require 'rails_helper'
require 'support/factory_bot'

RSpec.feature 'UserSignIns', type: :feature do
  scenario 'User signs in successfully' do
    user = FactoryBot.create(:user)
    user.confirm if user.respond_to?(:confirm)

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    expect(page).to have_text('Welcome to my Budget app, made by Luis')
  end
end
