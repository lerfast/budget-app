require 'rails_helper'

RSpec.describe 'groups/_form', type: :view do
  before do
    @group = Group.new
  end

  it 'renders the group form' do
    render partial: 'groups/form', locals: { group: @group }
    expect(rendered).to have_selector('form')
  end
end
