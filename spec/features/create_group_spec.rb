require 'rails_helper'
require 'support/factory_bot'

RSpec.feature 'Groups', type: :feature do
  before do
    user = create(:user)
    user.confirm if user.respond_to?(:confirm)
    login_as(user, scope: :user)
  end

  scenario 'User creates a new group' do
    visit new_group_path

    fill_in 'Name', with: 'New Group'
  end
end
