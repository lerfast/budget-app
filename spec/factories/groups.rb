# spec/factories/groups.rb

FactoryBot.define do
  factory :group do
    name { Faker::Lorem.unique.word }  # Esto generará un nombre único para cada grupo
    icon { 'test_icon.png' }
    user
  end
end
