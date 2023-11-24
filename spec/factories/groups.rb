FactoryBot.define do
  factory :group do
    name { 'Test Group' }
    icon { 'test_icon.png' }
    user
  end
end
