require 'rails_helper'

RSpec.describe "home/index", type: :view do
  before do
    allow(view).to receive(:user_signed_in?).and_return(true)
  end

  it "displays welcome message" do
    render
    expect(rendered).to include("Welcome to my Budget app")
  end
end
