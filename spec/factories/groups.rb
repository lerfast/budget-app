FactoryBot.define do
  factory :group do
    name { Faker::Lorem.unique.word }
    icon { 'test_icon.png' }
    user
  end
end
