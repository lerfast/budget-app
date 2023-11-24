require 'rails_helper'

RSpec.describe 'groups/index', type: :view do
  before do
    assign(:groups,
           [create(:group, name: 'Group 1', icon: 'icon1.png'), create(:group, name: 'Group 2', icon: 'icon2.png')])
  end

  it 'displays all groups' do
    render
    expect(rendered).to include('Group 1')
    expect(rendered).to include('Group 2')
  end
end
